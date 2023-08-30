// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DonationStatus _$DonationStatusFromJson(Map<String, dynamic> json) {
  return _DonationStatus.fromJson(json);
}

/// @nodoc
mixin _$DonationStatus {
  DonationState get name =>
      throw _privateConstructorUsedError; //  UserInformation? needy,
  DateTime? get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonationStatusCopyWith<DonationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationStatusCopyWith<$Res> {
  factory $DonationStatusCopyWith(
          DonationStatus value, $Res Function(DonationStatus) then) =
      _$DonationStatusCopyWithImpl<$Res, DonationStatus>;
  @useResult
  $Res call({DonationState name, DateTime? createdDate});
}

/// @nodoc
class _$DonationStatusCopyWithImpl<$Res, $Val extends DonationStatus>
    implements $DonationStatusCopyWith<$Res> {
  _$DonationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as DonationState,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DonationStatusCopyWith<$Res>
    implements $DonationStatusCopyWith<$Res> {
  factory _$$_DonationStatusCopyWith(
          _$_DonationStatus value, $Res Function(_$_DonationStatus) then) =
      __$$_DonationStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DonationState name, DateTime? createdDate});
}

/// @nodoc
class __$$_DonationStatusCopyWithImpl<$Res>
    extends _$DonationStatusCopyWithImpl<$Res, _$_DonationStatus>
    implements _$$_DonationStatusCopyWith<$Res> {
  __$$_DonationStatusCopyWithImpl(
      _$_DonationStatus _value, $Res Function(_$_DonationStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? createdDate = freezed,
  }) {
    return _then(_$_DonationStatus(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as DonationState,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DonationStatus
    with DiagnosticableTreeMixin
    implements _DonationStatus {
  const _$_DonationStatus({required this.name, this.createdDate});

  factory _$_DonationStatus.fromJson(Map<String, dynamic> json) =>
      _$$_DonationStatusFromJson(json);

  @override
  final DonationState name;
//  UserInformation? needy,
  @override
  final DateTime? createdDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DonationStatus(name: $name, createdDate: $createdDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DonationStatus'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdDate', createdDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DonationStatus &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, createdDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DonationStatusCopyWith<_$_DonationStatus> get copyWith =>
      __$$_DonationStatusCopyWithImpl<_$_DonationStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DonationStatusToJson(
      this,
    );
  }
}

abstract class _DonationStatus implements DonationStatus {
  const factory _DonationStatus(
      {required final DonationState name,
      final DateTime? createdDate}) = _$_DonationStatus;

  factory _DonationStatus.fromJson(Map<String, dynamic> json) =
      _$_DonationStatus.fromJson;

  @override
  DonationState get name;
  @override //  UserInformation? needy,
  DateTime? get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_DonationStatusCopyWith<_$_DonationStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
