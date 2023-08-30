// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Admin _$$_AdminFromJson(Map<String, dynamic> json) => _$_Admin(
      adminType: $enumDecode(_$AdminTypeEnumMap, json['adminType']),
    );

Map<String, dynamic> _$$_AdminToJson(_$_Admin instance) => <String, dynamic>{
      'adminType': _$AdminTypeEnumMap[instance.adminType]!,
    };

const _$AdminTypeEnumMap = {
  AdminType.dataEntry: 'dataEntry',
  AdminType.administration: 'administration',
};
