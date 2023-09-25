// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      id: json['id'] as String?,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      secoundName: json['secoundName'] as String?,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      username: json['username'] as String,
      password: json['password'] as String,
      email: json['email'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      bio: json['bio'] as String?,
      needy: json['needy'] == null
          ? null
          : Needy.fromJson(json['needy'] as Map<String, dynamic>),
      benefactorModel: json['benefactorModel'] == null
          ? null
          : BenefactorModel.fromJson(
              json['benefactorModel'] as Map<String, dynamic>),
      admin: json['admin'] == null
          ? null
          : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      isOnline: json['isOnline'] as bool? ?? false,
      accountType: $enumDecode(_$AccountTypeEnumMap, json['accountType']),
      imageUrl: json['imageUrl'] as String?,
      creatorId: json['creatorId'] as String?,
      token: json['token'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'secoundName': instance.secoundName,
      'birthday': instance.birthday?.toIso8601String(),
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'bio': instance.bio,
      'needy': instance.needy,
      'benefactorModel': instance.benefactorModel,
      'admin': instance.admin,
      'isOnline': instance.isOnline,
      'accountType': _$AccountTypeEnumMap[instance.accountType]!,
      'imageUrl': instance.imageUrl,
      'creatorId': instance.creatorId,
      'token': instance.token,
      'isActive': instance.isActive,
    };

const _$AccountTypeEnumMap = {
  AccountType.needy: 'needy',
  AccountType.benfactor: 'benfactor',
  AccountType.admin: 'admin',
};
