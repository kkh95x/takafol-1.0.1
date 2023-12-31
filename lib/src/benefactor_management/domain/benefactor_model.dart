// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:takafol/src/core/domain/note_model.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'benefactor_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'benefactor_model.g.dart';

@freezed
class BenefactorModel with _$BenefactorModel {
  const factory BenefactorModel({
    int? starsCount,

  
    required List<Note> notes,
  }) = _BenefactorModel;

  factory BenefactorModel.fromJson(Map<String, Object?> json)
      => _$BenefactorModelFromJson(json);
}