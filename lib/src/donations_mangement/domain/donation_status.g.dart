// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DonationStatus _$$_DonationStatusFromJson(Map<String, dynamic> json) =>
    _$_DonationStatus(
      name: $enumDecode(_$DonationStateEnumMap, json['name']),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_DonationStatusToJson(_$_DonationStatus instance) =>
    <String, dynamic>{
      'name': _$DonationStateEnumMap[instance.name]!,
      'createdDate': instance.createdDate?.toIso8601String(),
    };

const _$DonationStateEnumMap = {
  DonationState.created: 'created',
  DonationState.send: 'send',
  DonationState.acypt: 'acypt',
  DonationState.recived: 'recived',
  DonationState.complete: 'complete',
  DonationState.rejectFromNeed: 'rejectFromNeed',
  DonationState.rejectFromBenfactor: 'rejectFromBenfactor',
};
