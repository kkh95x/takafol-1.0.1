import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final playedSound = StateProvider<String>((ref) {
  return "";
});

final isPlayingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

final audioPlayerProvider = Provider.autoDispose<AudioPlayer>((ref) {
  final audioPlayer = AudioPlayer();

  audioPlayer.onPlayerComplete.listen((event) {
    ref.read(isPlayingProvider.notifier).state = false;
  });

  return audioPlayer;
});

class StaticVoiceComponent extends ConsumerWidget {
  const StaticVoiceComponent({
    this.urlVoice,
    this.color,
    super.key,
    this.recordColor
  });
  final String? urlVoice;
  final Color? color;
  final Color? recordColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPlaying = ref.watch(isPlayingProvider);
    final audioPlayer = ref.watch(audioPlayerProvider);
    return Container(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: color ?? Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: [
              if (isPlaying && ref.read(playedSound) == urlVoice)
                IconButton(
                  onPressed: () {
                    audioPlayer.pause();
                    ref.read(isPlayingProvider.notifier).state = false;
                  },
                  icon:  Icon(
                    Icons.pause,
                    color:recordColor?? Colors.white,
                    size: 22,
                  ),
                ),
              if (isPlaying && ref.read(playedSound) != urlVoice)
                IconButton(
                  onPressed: () {
                    ref.read(playedSound.notifier).state = urlVoice!;
                    audioPlayer.play(UrlSource(urlVoice!));
                    ref.read(isPlayingProvider.notifier).state = true;
                  },
                  icon:  Icon(
                    Icons.play_arrow,
                    color:recordColor?? Colors.white,
                    size: 22,
                  ),
                ),
              if (!isPlaying && ref.read(playedSound) != urlVoice)
                IconButton(
                  onPressed: () {
                    ref.read(playedSound.notifier).state = urlVoice!;
                    ref.read(isPlayingProvider.notifier).state = true;
                    audioPlayer.play(UrlSource(urlVoice!));
                  },
                  icon:  Icon(
                    Icons.play_arrow,
                    color:recordColor?? Colors.white,
                    size: 22,
                  ),
                ),
              if (!isPlaying && ref.read(playedSound) == urlVoice)
                IconButton(
                  onPressed: () {
                    ref.read(playedSound.notifier).state = urlVoice!;
                    ref.read(isPlayingProvider.notifier).state = true;
                    audioPlayer.play(UrlSource(urlVoice!));
                  },
                  icon:  Icon(
                    Icons.play_arrow,
                    color:recordColor?? Colors.white,
                    size: 22,
                  ),
                ),
              const SizedBox(
                width: 10,
              ),
              if (!isPlaying)
                Expanded(
                  child: CustomPaint(
                    painter: StaticWaveformPainter(
                        List<double>.generate(
                          100,
                          (index) {
                            return  Random().nextDouble()/2;
                          },
                        ),
                     recordColor??   Colors.white.withOpacity(0.7)),
                    child: const SizedBox(
                      height: 30,
                    ),
                  ),
                ),
              if (isPlaying && ref.read(playedSound) == urlVoice)
                Expanded(
                  child: CustomPaint(
                    painter: StaticWaveformPainter(
                        List<double>.generate(
                          100,
                          (index) {
                            return Random().nextDouble();
                          },
                        ),
                       recordColor?? Colors.white.withOpacity(0.7)),
                    child: SizedBox(
                      height: 30.h,
                    ),
                  ),
                ),
              if (isPlaying && ref.read(playedSound) != urlVoice)
                Expanded(
                  child: CustomPaint(
                    painter: StaticWaveformPainter(
                        List<double>.generate(
                          100,
                          (index) {
                            return 0.5;
                          },
                        ),
                       recordColor?? Colors.white.withOpacity(0.7)),
                    child: SizedBox(
                      height: 30.h,
                    ),
                  ),
                ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StaticWaveformPainter extends CustomPainter {
  final List<double> waveform;
  final Color color;
  StaticWaveformPainter(this.waveform, this.color);

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
