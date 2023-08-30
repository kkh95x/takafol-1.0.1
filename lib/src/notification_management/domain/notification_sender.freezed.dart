// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_sender.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationSender _$NotificationSenderFromJson(Map<String, dynamic> json) {
  return _NotificationSender.fromJson(json);
}

/// @nodoc
mixin _$NotificationSender {
  String get title => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  UserInformation get senderInfo => throw _privateConstructorUsedError;
  String get reciveId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSenderCopyWith<NotificationSender> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSenderCopyWith<$Res> {
  factory $NotificationSenderCopyWith(
          NotificationSender value, $Res Function(NotificationSender) then) =
      _$NotificationSenderCopyWithImpl<$Res, NotificationSender>;
  @useResult
  $Res call(
      {String title,
      String? id,
      String body,
      UserInformation senderInfo,
      String reciveId});

  $UserInformationCopyWith<$Res> get senderInfo;
}

/// @nodoc
class _$NotificationSenderCopyWithImpl<$Res, $Val extends NotificationSender>
    implements $NotificationSenderCopyWith<$Res> {
  _$NotificationSenderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? body = null,
    Object? senderInfo = null,
    Object? reciveId = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      senderInfo: null == senderInfo
          ? _value.senderInfo
          : senderInfo // ignore: cast_nullable_to_non_nullable
              as UserInformation,
      reciveId: null == reciveId
          ? _value.reciveId
          : reciveId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInformationCopyWith<$Res> get senderInfo {
    return $UserInformationCopyWith<$Res>(_value.senderInfo, (value) {
      return _then(_value.copyWith(senderInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationSenderCopyWith<$Res>
    implements $NotificationSenderCopyWith<$Res> {
  factory _$$_NotificationSenderCopyWith(_$_NotificationSender value,
          $Res Function(_$_NotificationSender) then) =
      __$$_NotificationSenderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? id,
      String body,
      UserInformation senderInfo,
      String reciveId});

  @override
  $UserInformationCopyWith<$Res> get senderInfo;
}

/// @nodoc
class __$$_NotificationSenderCopyWithImpl<$Res>
    extends _$NotificationSenderCopyWithImpl<$Res, _$_NotificationSender>
    implements _$$_NotificationSenderCopyWith<$Res> {
  __$$_NotificationSenderCopyWithImpl(
      _$_NotificationSender _value, $Res Function(_$_NotificationSender) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = freezed,
    Object? body = null,
    Object? senderInfo = null,
    Object? reciveId = null,
  }) {
    return _then(_$_NotificationSender(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      senderInfo: null == senderInfo
          ? _value.senderInfo
          : senderInfo // ignore: cast_nullable_to_non_nullable
              as UserInformation,
      reciveId: null == reciveId
          ? _value.reciveId
          : reciveId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationSender
    with DiagnosticableTreeMixin
    implements _NotificationSender {
  const _$_NotificationSender(
      {required this.title,
      this.id,
      required this.body,
      required this.senderInfo,
      required this.reciveId});

  factory _$_NotificationSender.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationSenderFromJson(json);

  @override
  final String title;
  @override
  final String? id;
  @override
  final String body;
  @override
  final UserInformation senderInfo;
  @override
  final String reciveId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationSender(title: $title, id: $id, body: $body, senderInfo: $senderInfo, reciveId: $reciveId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationSender'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('senderInfo', senderInfo))
      ..add(DiagnosticsProperty('reciveId', reciveId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationSender &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.senderInfo, senderInfo) ||
                other.senderInfo == senderInfo) &&
            (identical(other.reciveId, reciveId) ||
                other.reciveId == reciveId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, id, body, senderInfo, reciveId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationSenderCopyWith<_$_NotificationSender> get copyWith =>
      __$$_NotificationSenderCopyWithImpl<_$_NotificationSender>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationSenderToJson(
      this,
    );
  }
}

abstract class _NotificationSender implements NotificationSender {
  const factory _NotificationSender(
      {required final String title,
      final String? id,
      required final String body,
      required final UserInformation senderInfo,
      required final String reciveId}) = _$_NotificationSender;

  factory _NotificationSender.fromJson(Map<String, dynamic> json) =
      _$_NotificationSender.fromJson;

  @override
  String get title;
  @override
  String? get id;
  @override
  String get body;
  @override
  UserInformation get senderInfo;
  @override
  String get reciveId;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationSenderCopyWith<_$_NotificationSender> get copyWith =>
      throw _privateConstructorUsedError;
}
