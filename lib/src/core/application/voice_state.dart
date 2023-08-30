// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_state.freezed.dart';

enum VoiceStatus {
  ready,
  loading,
  recording,
  playing,
  stop,
}

@freezed
class VoiceState with _$VoiceState {
  factory VoiceState({
    required VoiceStatus status,
    String? urlPath,
    String? localPath,
    String? maxDuration,
    String? position,    
    String? maxDurationMilisecond,
    String? positionMilisecond,
    bool? isExistVoice,
  }) = _VoiceState;
}
