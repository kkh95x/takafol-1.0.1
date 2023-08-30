import 'dart:async';
import 'dart:io';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/flutter_sound.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'voice_state.dart';

final voiceControlProvider = StateNotifierProvider.autoDispose
    .family<VoiceControl, VoiceState, String?>((ref, urlPath) {
  return VoiceControl(urlPath: urlPath);
});

class VoiceControl extends StateNotifier<VoiceState> {
  VoiceControl({this.urlPath})
      : super(VoiceState(status: VoiceStatus.loading)) {
    initRecord();
    initPlay();
    loadVoiceFromUrl(urlPath).then((localPath) {
      state = state.copyWith(
        // localPath: localPath,
        // status: VoiceStatus.ready,
        urlPath: urlPath,
        // isExistVoice: localPath == null ? false : true,
      );
    });
  }

  final String? urlPath;
  late FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool recordIsReady = false;

  FlutterSoundPlayer mPlayer = FlutterSoundPlayer();
  bool playerIsReady = false;

  Future record() async {
    const theSource = AudioSource.microphone;
    // ------------------
    // if (!recordIsReady) return;
    await initRecord();
    final tempDir = await getApplicationDocumentsDirectory();
    final mPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.aac';

    await recorder.startRecorder(toFile: mPath, audioSource: theSource);

    recorder.onProgress!.listen((e) {
      var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds,
          isUtc: true);
      var timeText = DateFormat('mm:ss:SS', 'en_GB').format(date);
      // print(timeText.substring(0, 8));
      state = state.copyWith(
          position: timeText.substring(0, 8),
          maxDuration: timeText.substring(0, 8));
    });
  }

  Future<String?> stop() async {
    if (!recordIsReady) return null;
    final path = await recorder.stopRecorder();
    return path;
  }

  Future initRecord() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "you Cann't record voice , you don't have permission" ;
    }
    await recorder.openRecorder();
    recordIsReady = true;
    await recorder.setSubscriptionDuration(const Duration(milliseconds: 50));
  }

  Future initPlay() async {
    await mPlayer.openPlayer().then((value) {
      playerIsReady = true;
    });
    await mPlayer.setSubscriptionDuration(const Duration(milliseconds: 100));
  }

  Future<void> playVoice(String path) async {
    if (!playerIsReady) return;
    await initPlay();

    mPlayer.onProgress!.listen((event) {
      Duration maxDuration = event.duration;
      Duration position = event.position;
      var datePosition = DateTime.fromMillisecondsSinceEpoch(
          position.inMilliseconds,
          isUtc: true);
      var progressTime = DateFormat('mm:ss:SS', 'en_GB').format(datePosition);
      // print(progressTime.substring(0, 8));
      var dateDuration = DateTime.fromMillisecondsSinceEpoch(
          maxDuration.inMilliseconds,
          isUtc: true);
      var durationTime = DateFormat('mm:ss:SS', 'en_GB').format(dateDuration);

      state = state.copyWith(
          positionMilisecond: position.inMilliseconds.toString(),
          maxDurationMilisecond: maxDuration.inMilliseconds.toString(),
          position: progressTime.substring(0, 8),
          maxDuration: durationTime.substring(0, 8));
    });

    await mPlayer.startPlayer(
        fromURI: path,
        whenFinished: () {
          // print("when Finished player");
          state = state.copyWith(status: VoiceStatus.ready);
        });
  }

  Future<void> stopPlayer() async {
    await mPlayer.stopPlayer();
  }

  @override
  void dispose() {
    state = state.copyWith(isExistVoice: null, urlPath: null, localPath: null);
    stop();
    stopPlayer();
    mPlayer.closePlayer();
    recorder.closeRecorder();
    super.dispose();
  }

  Future<String?> loadVoiceFromUrl(String? path) async {
    // after load voice we return local path
    if (path == null) {
      state = state.copyWith(
        status: VoiceStatus.ready,
        isExistVoice: false,
      );
      return null;
    }
    final statuses = await Permission.storage.request();
    if (statuses.isGranted) {
      // await downloadFile(url: path).then((localPath) async {
      //   state = state.copyWith(
      //     localPath: localPath,
      //     status: VoiceStatus.ready,
      //     // urlPath: urlPath,
      //     isExistVoice: localPath == null ? false : true,
      //   );
      //   // return localPath;
      // });
    }
    return null;
    // return null;  //"/sdcard/Download/voices/temp.wav";
  }

  // Future<String?> downloadFile({required String url}) async {
  //   final ref = FirebaseStorage.instance.refFromURL(url);
  //   String? result;
  //   final appDocDir = await getApplicationDocumentsDirectory();
  //   final filePath = "${appDocDir.path}/${ref.name}";
  //   final file = File(filePath);
  //   try {
  //     if (file.existsSync()) {
  //       result = filePath;
  //     } else {
  //       final downloadTask = ref.writeToFile(file);
  //       downloadTask.snapshotEvents.listen((taskSnapshot) async {
  //         switch (taskSnapshot.state) {
  //           case TaskState.running:
  //             break;
  //           case TaskState.paused:
  //             break;
  //           case TaskState.success:
  //             BotToast.showText(text: "success" );
  //             result = file.path;
  //             //state
  //             break;
  //           case TaskState.canceled:
  //             BotToast.showText(text: "canceled" );
  //             break;
  //           case TaskState.error:
  //             BotToast.showText(text: "error" );
  //             break;
  //         }
  //       });
  //     }
  //   } catch (e) {
  //     if (e is FirebaseException && e.code == 'storage') {}
  //   }
  //   return result;
  // }

  changeState(VoiceStatus newStatus) async {
    final VoiceState oldState = state.copyWith();

    switch (newStatus) {
      case VoiceStatus.recording:
        state = oldState.copyWith(status: VoiceStatus.recording);
        await record();
        break;
      case VoiceStatus.playing:
        if (oldState.isExistVoice ?? false) {
          state = oldState.copyWith(status: VoiceStatus.playing);
          playVoice(oldState.localPath!);
        } else {
          state = oldState.copyWith(status: VoiceStatus.ready);
        }
        break;
      case VoiceStatus.stop:
        if (state.status == VoiceStatus.playing) {
          stopPlayer().then(
              (value) => state = oldState.copyWith(status: VoiceStatus.ready));
        } else {
          final s = stop().then((value) {
            state = oldState.copyWith(
                status: VoiceStatus.ready,
                localPath: value,
                isExistVoice: value != null ? true : false);
          });
        }
        break;
      default:
        state = oldState.copyWith(status: newStatus);
        break;
    }
  }

  deleteVoice() {
    state = state.copyWith(
        isExistVoice: false, localPath: null, status: VoiceStatus.ready);
  }
}
