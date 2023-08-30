// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$$_NoteFromJson(Map<String, dynamic> json) => _$_Note(
      text: json['text'] as String?,
      voiceUrl: (json['voiceUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: (json['imageUrl'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'text': instance.text,
      'voiceUrl': instance.voiceUrl,
      'imageUrl': instance.imageUrl,
    };
