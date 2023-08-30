// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Donation _$$_DonationFromJson(Map<String, dynamic> json) => _$_Donation(
      id: json['id'] as String?,
      title: json['title'] as String,
      body: json['body'] as String?,
      needy: json['needy'] == null
          ? null
          : UserInformation.fromJson(json['needy'] as Map<String, dynamic>),
      benfactor: json['benfactor'] == null
          ? null
          : UserInformation.fromJson(json['benfactor'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      currentStatus: DonationStatus.fromJson(
          json['currentStatus'] as Map<String, dynamic>),
      status: (json['status'] as List<dynamic>?)
          ?.map((e) => DonationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      notes: json['notes'] == null
          ? null
          : Note.fromJson(json['notes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DonationToJson(_$_Donation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'needy': instance.needy,
      'benfactor': instance.benfactor,
      'createdDate': instance.createdDate?.toIso8601String(),
      'currentStatus': instance.currentStatus,
      'status': instance.status,
      'notes': instance.notes,
    };
