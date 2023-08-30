// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Donation _$DonationFromJson(Map<String, dynamic> json) {
  return _Donation.fromJson(json);
}

/// @nodoc
mixin _$Donation {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  UserInformation? get needy => throw _privateConstructorUsedError;
  UserInformation? get benfactor => throw _privateConstructorUsedError;
  DateTime? get createdDate =>
      throw _privateConstructorUsedError; //  List<Message>? messages,
  DonationStatus get currentStatus => throw _privateConstructorUsedError;
  List<DonationStatus>? get status => throw _privateConstructorUsedError;
  Note? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonationCopyWith<Donation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationCopyWith<$Res> {
  factory $DonationCopyWith(Donation value, $Res Function(Donation) then) =
      _$DonationCopyWithImpl<$Res, Donation>;
  @useResult
  $Res call(
      {String? id,
      String title,
      String? body,
      UserInformation? needy,
      UserInformation? benfactor,
      DateTime? createdDate,
      DonationStatus currentStatus,
      List<DonationStatus>? status,
      Note? notes});

  $UserInformationCopyWith<$Res>? get needy;
  $UserInformationCopyWith<$Res>? get benfactor;
  $DonationStatusCopyWith<$Res> get currentStatus;
  $NoteCopyWith<$Res>? get notes;
}

/// @nodoc
class _$DonationCopyWithImpl<$Res, $Val extends Donation>
    implements $DonationCopyWith<$Res> {
  _$DonationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? body = freezed,
    Object? needy = freezed,
    Object? benfactor = freezed,
    Object? createdDate = freezed,
    Object? currentStatus = null,
    Object? status = freezed,
    Object? notes = freezed,
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
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      needy: freezed == needy
          ? _value.needy
          : needy // ignore: cast_nullable_to_non_nullable
              as UserInformation?,
      benfactor: freezed == benfactor
          ? _value.benfactor
          : benfactor // ignore: cast_nullable_to_non_nullable
              as UserInformation?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as DonationStatus,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<DonationStatus>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Note?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInformationCopyWith<$Res>? get needy {
    if (_value.needy == null) {
      return null;
    }

    return $UserInformationCopyWith<$Res>(_value.needy!, (value) {
      return _then(_value.copyWith(needy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInformationCopyWith<$Res>? get benfactor {
    if (_value.benfactor == null) {
      return null;
    }

    return $UserInformationCopyWith<$Res>(_value.benfactor!, (value) {
      return _then(_value.copyWith(benfactor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DonationStatusCopyWith<$Res> get currentStatus {
    return $DonationStatusCopyWith<$Res>(_value.currentStatus, (value) {
      return _then(_value.copyWith(currentStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteCopyWith<$Res>? get notes {
    if (_value.notes == null) {
      return null;
    }

    return $NoteCopyWith<$Res>(_value.notes!, (value) {
      return _then(_value.copyWith(notes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DonationCopyWith<$Res> implements $DonationCopyWith<$Res> {
  factory _$$_DonationCopyWith(
          _$_Donation value, $Res Function(_$_Donation) then) =
      __$$_DonationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      String? body,
      UserInformation? needy,
      UserInformation? benfactor,
      DateTime? createdDate,
      DonationStatus currentStatus,
      List<DonationStatus>? status,
      Note? notes});

  @override
  $UserInformationCopyWith<$Res>? get needy;
  @override
  $UserInformationCopyWith<$Res>? get benfactor;
  @override
  $DonationStatusCopyWith<$Res> get currentStatus;
  @override
  $NoteCopyWith<$Res>? get notes;
}

/// @nodoc
class __$$_DonationCopyWithImpl<$Res>
    extends _$DonationCopyWithImpl<$Res, _$_Donation>
    implements _$$_DonationCopyWith<$Res> {
  __$$_DonationCopyWithImpl(
      _$_Donation _value, $Res Function(_$_Donation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? body = freezed,
    Object? needy = freezed,
    Object? benfactor = freezed,
    Object? createdDate = freezed,
    Object? currentStatus = null,
    Object? status = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$_Donation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      needy: freezed == needy
          ? _value.needy
          : needy // ignore: cast_nullable_to_non_nullable
              as UserInformation?,
      benfactor: freezed == benfactor
          ? _value.benfactor
          : benfactor // ignore: cast_nullable_to_non_nullable
              as UserInformation?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as DonationStatus,
      status: freezed == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<DonationStatus>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Note?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Donation with DiagnosticableTreeMixin implements _Donation {
  const _$_Donation(
      {this.id,
      required this.title,
      this.body,
      this.needy,
      this.benfactor,
      this.createdDate,
      required this.currentStatus,
      final List<DonationStatus>? status,
      this.notes})
      : _status = status;

  factory _$_Donation.fromJson(Map<String, dynamic> json) =>
      _$$_DonationFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final String? body;
  @override
  final UserInformation? needy;
  @override
  final UserInformation? benfactor;
  @override
  final DateTime? createdDate;
//  List<Message>? messages,
  @override
  final DonationStatus currentStatus;
  final List<DonationStatus>? _status;
  @override
  List<DonationStatus>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Note? notes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Donation(id: $id, title: $title, body: $body, needy: $needy, benfactor: $benfactor, createdDate: $createdDate, currentStatus: $currentStatus, status: $status, notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Donation'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('needy', needy))
      ..add(DiagnosticsProperty('benfactor', benfactor))
      ..add(DiagnosticsProperty('createdDate', createdDate))
      ..add(DiagnosticsProperty('currentStatus', currentStatus))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Donation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.needy, needy) || other.needy == needy) &&
            (identical(other.benfactor, benfactor) ||
                other.benfactor == benfactor) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      body,
      needy,
      benfactor,
      createdDate,
      currentStatus,
      const DeepCollectionEquality().hash(_status),
      notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DonationCopyWith<_$_Donation> get copyWith =>
      __$$_DonationCopyWithImpl<_$_Donation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DonationToJson(
      this,
    );
  }
}

abstract class _Donation implements Donation {
  const factory _Donation(
      {final String? id,
      required final String title,
      final String? body,
      final UserInformation? needy,
      final UserInformation? benfactor,
      final DateTime? createdDate,
      required final DonationStatus currentStatus,
      final List<DonationStatus>? status,
      final Note? notes}) = _$_Donation;

  factory _Donation.fromJson(Map<String, dynamic> json) = _$_Donation.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  String? get body;
  @override
  UserInformation? get needy;
  @override
  UserInformation? get benfactor;
  @override
  DateTime? get createdDate;
  @override //  List<Message>? messages,
  DonationStatus get currentStatus;
  @override
  List<DonationStatus>? get status;
  @override
  Note? get notes;
  @override
  @JsonKey(ignore: true)
  _$$_DonationCopyWith<_$_Donation> get copyWith =>
      throw _privateConstructorUsedError;
}
