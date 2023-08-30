// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_admin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationAdmin _$NotificationAdminFromJson(Map<String, dynamic> json) {
  return _NotificationAdmin.fromJson(json);
}

/// @nodoc
mixin _$NotificationAdmin {
  String? get id => throw _privateConstructorUsedError;
  UserInformation get admin => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  AccountType? get accountType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationAdminCopyWith<NotificationAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationAdminCopyWith<$Res> {
  factory $NotificationAdminCopyWith(
          NotificationAdmin value, $Res Function(NotificationAdmin) then) =
      _$NotificationAdminCopyWithImpl<$Res, NotificationAdmin>;
  @useResult
  $Res call(
      {String? id,
      UserInformation admin,
      String title,
      String body,
      DateTime date,
      AccountType? accountType});

  $UserInformationCopyWith<$Res> get admin;
}

/// @nodoc
class _$NotificationAdminCopyWithImpl<$Res, $Val extends NotificationAdmin>
    implements $NotificationAdminCopyWith<$Res> {
  _$NotificationAdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? admin = null,
    Object? title = null,
    Object? body = null,
    Object? date = null,
    Object? accountType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as UserInformation,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInformationCopyWith<$Res> get admin {
    return $UserInformationCopyWith<$Res>(_value.admin, (value) {
      return _then(_value.copyWith(admin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationAdminCopyWith<$Res>
    implements $NotificationAdminCopyWith<$Res> {
  factory _$$_NotificationAdminCopyWith(_$_NotificationAdmin value,
          $Res Function(_$_NotificationAdmin) then) =
      __$$_NotificationAdminCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      UserInformation admin,
      String title,
      String body,
      DateTime date,
      AccountType? accountType});

  @override
  $UserInformationCopyWith<$Res> get admin;
}

/// @nodoc
class __$$_NotificationAdminCopyWithImpl<$Res>
    extends _$NotificationAdminCopyWithImpl<$Res, _$_NotificationAdmin>
    implements _$$_NotificationAdminCopyWith<$Res> {
  __$$_NotificationAdminCopyWithImpl(
      _$_NotificationAdmin _value, $Res Function(_$_NotificationAdmin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? admin = null,
    Object? title = null,
    Object? body = null,
    Object? date = null,
    Object? accountType = freezed,
  }) {
    return _then(_$_NotificationAdmin(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as UserInformation,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationAdmin
    with DiagnosticableTreeMixin
    implements _NotificationAdmin {
  const _$_NotificationAdmin(
      {this.id,
      required this.admin,
      required this.title,
      required this.body,
      required this.date,
      required this.accountType});

  factory _$_NotificationAdmin.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationAdminFromJson(json);

  @override
  final String? id;
  @override
  final UserInformation admin;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime date;
  @override
  final AccountType? accountType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationAdmin(id: $id, admin: $admin, title: $title, body: $body, date: $date, accountType: $accountType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationAdmin'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('admin', admin))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('accountType', accountType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationAdmin &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, admin, title, body, date, accountType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationAdminCopyWith<_$_NotificationAdmin> get copyWith =>
      __$$_NotificationAdminCopyWithImpl<_$_NotificationAdmin>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationAdminToJson(
      this,
    );
  }
}

abstract class _NotificationAdmin implements NotificationAdmin {
  const factory _NotificationAdmin(
      {final String? id,
      required final UserInformation admin,
      required final String title,
      required final String body,
      required final DateTime date,
      required final AccountType? accountType}) = _$_NotificationAdmin;

  factory _NotificationAdmin.fromJson(Map<String, dynamic> json) =
      _$_NotificationAdmin.fromJson;

  @override
  String? get id;
  @override
  UserInformation get admin;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get date;
  @override
  AccountType? get accountType;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationAdminCopyWith<_$_NotificationAdmin> get copyWith =>
      throw _privateConstructorUsedError;
}
