// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) {
  return _AppNotification.fromJson(json);
}

/// @nodoc
mixin _$AppNotification {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  DateTime? get created_at => throw _privateConstructorUsedError;
  UserInformation get from => throw _privateConstructorUsedError;
  String get refreanceId => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  NotificationState get state => throw _privateConstructorUsedError;
  String get extra => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
          AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call(
      {String? id,
      String title,
      String body,
      DateTime? created_at,
      UserInformation from,
      String refreanceId,
      NotificationType type,
      NotificationState state,
      String extra});

  $UserInformationCopyWith<$Res> get from;
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? body = null,
    Object? created_at = freezed,
    Object? from = null,
    Object? refreanceId = null,
    Object? type = null,
    Object? state = null,
    Object? extra = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as UserInformation,
      refreanceId: null == refreanceId
          ? _value.refreanceId
          : refreanceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NotificationState,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInformationCopyWith<$Res> get from {
    return $UserInformationCopyWith<$Res>(_value.from, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppNotificationCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$$_AppNotificationCopyWith(
          _$_AppNotification value, $Res Function(_$_AppNotification) then) =
      __$$_AppNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      String body,
      DateTime? created_at,
      UserInformation from,
      String refreanceId,
      NotificationType type,
      NotificationState state,
      String extra});

  @override
  $UserInformationCopyWith<$Res> get from;
}

/// @nodoc
class __$$_AppNotificationCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$_AppNotification>
    implements _$$_AppNotificationCopyWith<$Res> {
  __$$_AppNotificationCopyWithImpl(
      _$_AppNotification _value, $Res Function(_$_AppNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? body = null,
    Object? created_at = freezed,
    Object? from = null,
    Object? refreanceId = null,
    Object? type = null,
    Object? state = null,
    Object? extra = null,
  }) {
    return _then(_$_AppNotification(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as UserInformation,
      refreanceId: null == refreanceId
          ? _value.refreanceId
          : refreanceId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as NotificationState,
      extra: null == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppNotification
    with DiagnosticableTreeMixin
    implements _AppNotification {
  const _$_AppNotification(
      {this.id,
      required this.title,
      required this.body,
      this.created_at,
      required this.from,
      required this.refreanceId,
      required this.type,
      this.state = NotificationState.usSeen,
      required this.extra});

  factory _$_AppNotification.fromJson(Map<String, dynamic> json) =>
      _$$_AppNotificationFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final String body;
// ignore: non_constant_identifier_names
  @override
  final DateTime? created_at;
  @override
  final UserInformation from;
  @override
  final String refreanceId;
  @override
  final NotificationType type;
  @override
  @JsonKey()
  final NotificationState state;
  @override
  final String extra;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppNotification(id: $id, title: $title, body: $body, created_at: $created_at, from: $from, refreanceId: $refreanceId, type: $type, state: $state, extra: $extra)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppNotification'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('refreanceId', refreanceId))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('extra', extra));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppNotification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.refreanceId, refreanceId) ||
                other.refreanceId == refreanceId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.extra, extra) || other.extra == extra));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, body, created_at,
      from, refreanceId, type, state, extra);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppNotificationCopyWith<_$_AppNotification> get copyWith =>
      __$$_AppNotificationCopyWithImpl<_$_AppNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppNotificationToJson(
      this,
    );
  }
}

abstract class _AppNotification implements AppNotification {
  const factory _AppNotification(
      {final String? id,
      required final String title,
      required final String body,
      final DateTime? created_at,
      required final UserInformation from,
      required final String refreanceId,
      required final NotificationType type,
      final NotificationState state,
      required final String extra}) = _$_AppNotification;

  factory _AppNotification.fromJson(Map<String, dynamic> json) =
      _$_AppNotification.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  String get body;
  @override // ignore: non_constant_identifier_names
  DateTime? get created_at;
  @override
  UserInformation get from;
  @override
  String get refreanceId;
  @override
  NotificationType get type;
  @override
  NotificationState get state;
  @override
  String get extra;
  @override
  @JsonKey(ignore: true)
  _$$_AppNotificationCopyWith<_$_AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
