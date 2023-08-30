


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
final recordVoiceMessage=StateNotifierProvider<VoiceMessage,String>((ref) => VoiceMessage());


class VoiceMessage  extends StateNotifier<String>{
  VoiceMessage():super(""){
    initRecord();
  }
  
  late FlutterSoundRecorder recorder = FlutterSoundRecorder();
  bool recordIsReady = false;

  FlutterSoundPlayer mPlayer = FlutterSoundPlayer();
  bool playerIsReady = false;
Future initRecord() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw "you Cann't record voice , you don't have permission" ;
    }
    await recorder.openRecorder();
    recordIsReady = true;
    await recorder.setSubscriptionDuration(const Duration(milliseconds: 50));
  }

   @override
  void dispose() {
    // state = state.copyWith(isExistVoice: null, urlPath: null, localPath: null);
    stop();
    mPlayer.closePlayer();
    recorder.closeRecorder();
    super.dispose();

   
  }
   Future<String?> stop() async {
    if (!recordIsReady) return null;
    final path = await recorder.stopRecorder();
    return path;}
    
  Future record() async {
    const theSource = AudioSource.microphone;
    // ------------------
    // if (!recordIsReady) return;
    await initRecord();
    final tempDir = await getApplicationDocumentsDirectory();
    final mPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.aac';

    await recorder.startRecorder(toFile: mPath, audioSource: theSource);

  }
}