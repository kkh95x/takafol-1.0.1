// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'benefactor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BenefactorModel _$BenefactorModelFromJson(Map<String, dynamic> json) {
  return _BenefactorModel.fromJson(json);
}

/// @nodoc
mixin _$BenefactorModel {
  int? get starsCount => throw _privateConstructorUsedError;
  List<Note> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BenefactorModelCopyWith<BenefactorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BenefactorModelCopyWith<$Res> {
  factory $BenefactorModelCopyWith(
          BenefactorModel value, $Res Function(BenefactorModel) then) =
      _$BenefactorModelCopyWithImpl<$Res, BenefactorModel>;
  @useResult
  $Res call({int? starsCount, List<Note> notes});
}

/// @nodoc
class _$BenefactorModelCopyWithImpl<$Res, $Val extends BenefactorModel>
    implements $BenefactorModelCopyWith<$Res> {
  _$BenefactorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? starsCount = freezed,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      starsCount: freezed == starsCount
          ? _value.starsCount
          : starsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BenefactorModelCopyWith<$Res>
    implements $BenefactorModelCopyWith<$Res> {
  factory _$$_BenefactorModelCopyWith(
          _$_BenefactorModel value, $Res Function(_$_BenefactorModel) then) =
      __$$_BenefactorModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? starsCount, List<Note> notes});
}

/// @nodoc
class __$$_BenefactorModelCopyWithImpl<$Res>
    extends _$BenefactorModelCopyWithImpl<$Res, _$_BenefactorModel>
    implements _$$_BenefactorModelCopyWith<$Res> {
  __$$_BenefactorModelCopyWithImpl(
      _$_BenefactorModel _value, $Res Function(_$_BenefactorModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? starsCount = freezed,
    Object? notes = null,
  }) {
    return _then(_$_BenefactorModel(
      starsCount: freezed == starsCount
          ? _value.starsCount
          : starsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BenefactorModel
    with DiagnosticableTreeMixin
    implements _BenefactorModel {
  const _$_BenefactorModel({this.starsCount, required final List<Note> notes})
      : _notes = notes;

  factory _$_BenefactorModel.fromJson(Map<String, dynamic> json) =>
      _$$_BenefactorModelFromJson(json);

  @override
  final int? starsCount;
  final List<Note> _notes;
  @override
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BenefactorModel(starsCount: $starsCount, notes: $notes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BenefactorModel'))
      ..add(DiagnosticsProperty('starsCount', starsCount))
      ..add(DiagnosticsProperty('notes', notes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BenefactorModel &&
            (identical(other.starsCount, starsCount) ||
                other.starsCount == starsCount) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, starsCount, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BenefactorModelCopyWith<_$_BenefactorModel> get copyWith =>
      __$$_BenefactorModelCopyWithImpl<_$_BenefactorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BenefactorModelToJson(
      this,
    );
  }
}

abstract class _BenefactorModel implements BenefactorModel {
  const factory _BenefactorModel(
      {final int? starsCount,
      required final List<Note> notes}) = _$_BenefactorModel;

  factory _BenefactorModel.fromJson(Map<String, dynamic> json) =
      _$_BenefactorModel.fromJson;

  @override
  int? get starsCount;
  @override
  List<Note> get notes;
  @override
  @JsonKey(ignore: true)
  _$$_BenefactorModelCopyWith<_$_BenefactorModel> get copyWith =>
      throw _privateConstructorUsedError;
}
