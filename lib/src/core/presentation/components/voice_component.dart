import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../application/voice_controller.dart';
import '../../application/voice_state.dart';

class VoiceComponent extends ConsumerWidget {
  const VoiceComponent({
    required this.controlName,
    this.urlVoice,
   required this.forms,
    this.enableDelete = true,
    super.key,
  });
  final String? urlVoice;
  final String controlName;
  final FormGroup forms;
  final bool? enableDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final voice = ref.watch(voiceControlProvider(urlVoice));
    final form = forms ;
    form.control(controlName).value = voice.localPath;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Theme.of(context).colorScheme.tertiary),
      // padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          if (voice.status == VoiceStatus.loading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          if (voice.status == VoiceStatus.playing ||
              voice.status == VoiceStatus.recording)
            IconButton(
              onPressed: () {
                ref
                    .read(voiceControlProvider(urlVoice).notifier)
                    .changeState(VoiceStatus.stop);
              },
              icon: const Icon(
                Icons.stop,
                color: Colors.white,
                size: 22,
              ),
            ),
          if (voice.isExistVoice == true && voice.status == VoiceStatus.ready)
            IconButton(
              onPressed: () {
                ref
                    .read(voiceControlProvider(urlVoice).notifier)
                    .changeState(VoiceStatus.playing);
              },
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 22,
              ),
            ),
          if (voice.isExistVoice == false && voice.status == VoiceStatus.ready)
            IconButton(
              onPressed: () {
                ref
                    .read(voiceControlProvider(urlVoice).notifier)
                    .changeState(VoiceStatus.recording);
              },
              icon: const Icon(
                Icons.keyboard_voice,
                color: Colors.white,
                size: 22,
              ),
            ),
          if (voice.status == VoiceStatus.playing ||
              voice.status == VoiceStatus.recording)
            Text(
              voice.position ?? "00:00:00",
              style: const TextStyle(color: Colors.white),
            ),
          if (voice.status == VoiceStatus.ready && voice.isExistVoice == true)
            Text(
              voice.maxDuration ?? '00:00:00',
              style: const TextStyle(color: Colors.white),
            ),
          if (voice.status == VoiceStatus.ready && voice.isExistVoice == false)
            const Text(
              "00:00:00",
              style: TextStyle(color: Colors.white),
            ),
          const SizedBox(
            width: 10,
          ),
          if ((voice.status == VoiceStatus.ready ||
                  voice.status == VoiceStatus.loading) &&
              voice.isExistVoice == false)
            const Expanded(
              child: Text(
                'ملاحظة صوتية' ,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          if (voice.status == VoiceStatus.loading)
            const Expanded(
              child: Text(
                'جاري التحميل' ,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          if (voice.status == VoiceStatus.ready && voice.isExistVoice == true)
            Expanded(
              child: CustomPaint(
                painter: WaveformPainter(
                    List<double>.generate(
                      70,
                      (index) {
                        return Random().nextDouble();
                      },
                    ),
                    Colors.white.withOpacity(0.7)),
                child: const SizedBox(
                  height: 30,
                ),
              ),
            ),
          if (voice.status == VoiceStatus.playing ||
              voice.status == VoiceStatus.recording)
            Expanded(
              child: CustomPaint(
                painter: WaveformPainter(
                    List<double>.generate(
                      100,
                      (index) {
                        return Random().nextDouble();
                      },
                    ),
                    Colors.white.withOpacity(0.7)),
                child: const SizedBox(
                  height: 30,
                ),
              ),
            ),
          if (voice.isExistVoice == true &&
              voice.status == VoiceStatus.ready &&
              enableDelete != false)
            IconButton(
              onPressed: () {
                ref.read(voiceControlProvider(urlVoice).notifier).deleteVoice();
              },
              icon: const Icon(
                Icons.delete_rounded,
                color: Colors.white,
                size: 17,
              ),
            ),
          if ((voice.status == VoiceStatus.playing ||
                  voice.status == VoiceStatus.recording) &&
              enableDelete != false)
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_rounded,
                color: Colors.white.withOpacity(0.2),
                size: 17,
              ),
            ),
        ],
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final List<double> waveform;
  final Color color;
  WaveformPainter(this.waveform, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final width = size.width / waveform.length;

    for (var i = 0; i < waveform.length; i++) {
      final x = i * width;
      final height = waveform[i] * size.height / 2;
      final y = size.height / 2 - height;
      canvas.drawRect(Rect.fromLTWH(x, y, width / 2, height * 2), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
