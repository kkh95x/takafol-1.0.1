// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) {
  return _UserInformation.fromJson(json);
}

/// @nodoc
mixin _$UserInformation {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  AccountType? get accountType => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime? get birthDay => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInformationCopyWith<UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationCopyWith<$Res> {
  factory $UserInformationCopyWith(
          UserInformation value, $Res Function(UserInformation) then) =
      _$UserInformationCopyWithImpl<$Res, UserInformation>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      AccountType? accountType,
      String? imageUrl,
      DateTime? birthDay});
}

/// @nodoc
class _$UserInformationCopyWithImpl<$Res, $Val extends UserInformation>
    implements $UserInformationCopyWith<$Res> {
  _$UserInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? accountType = freezed,
    Object? imageUrl = freezed,
    Object? birthDay = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInformationCopyWith<$Res>
    implements $UserInformationCopyWith<$Res> {
  factory _$$_UserInformationCopyWith(
          _$_UserInformation value, $Res Function(_$_UserInformation) then) =
      __$$_UserInformationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      AccountType? accountType,
      String? imageUrl,
      DateTime? birthDay});
}

/// @nodoc
class __$$_UserInformationCopyWithImpl<$Res>
    extends _$UserInformationCopyWithImpl<$Res, _$_UserInformation>
    implements _$$_UserInformationCopyWith<$Res> {
  __$$_UserInformationCopyWithImpl(
      _$_UserInformation _value, $Res Function(_$_UserInformation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? accountType = freezed,
    Object? imageUrl = freezed,
    Object? birthDay = freezed,
  }) {
    return _then(_$_UserInformation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDay: freezed == birthDay
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInformation
    with DiagnosticableTreeMixin
    implements _UserInformation {
  const _$_UserInformation(
      {this.id, this.name, this.accountType, this.imageUrl, this.birthDay});

  factory _$_UserInformation.fromJson(Map<String, dynamic> json) =>
      _$$_UserInformationFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final AccountType? accountType;
  @override
  final String? imageUrl;
  @override
  final DateTime? birthDay;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInformation(id: $id, name: $name, accountType: $accountType, imageUrl: $imageUrl, birthDay: $birthDay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInformation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('accountType', accountType))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('birthDay', birthDay));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInformation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, accountType, imageUrl, birthDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInformationCopyWith<_$_UserInformation> get copyWith =>
      __$$_UserInformationCopyWithImpl<_$_UserInformation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInformationToJson(
      this,
    );
  }
}

abstract class _UserInformation implements UserInformation {
  const factory _UserInformation(
      {final String? id,
      final String? name,
      final AccountType? accountType,
      final String? imageUrl,
      final DateTime? birthDay}) = _$_UserInformation;

  factory _UserInformation.fromJson(Map<String, dynamic> json) =
      _$_UserInformation.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  AccountType? get accountType;
  @override
  String? get imageUrl;
  @override
  DateTime? get birthDay;
  @override
  @JsonKey(ignore: true)
  _$$_UserInformationCopyWith<_$_UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
