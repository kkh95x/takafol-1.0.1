// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'benefactor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BenefactorModel _$$_BenefactorModelFromJson(Map<String, dynamic> json) =>
    _$_BenefactorModel(
      starsCount: json['starsCount'] as int?,
      notes: (json['notes'] as List<dynamic>)
          .map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BenefactorModelToJson(_$_BenefactorModel instance) =>
    <String, dynamic>{
      'starsCount': instance.starsCount,
      'notes': instance.notes,
    };
