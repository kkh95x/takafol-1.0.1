// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dontions_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DonationListRealTimeStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Donation>? recipes) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stk) error,
    required TResult Function(List<Donation>? recipes) onGoingLoading,
    required TResult Function(
            List<Donation>? recipes, Object? e, StackTrace? stk)
        onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Donation>? recipes)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stk)? error,
    TResult? Function(List<Donation>? recipes)? onGoingLoading,
    TResult? Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Donation>? recipes)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stk)? error,
    TResult Function(List<Donation>? recipes)? onGoingLoading,
    TResult Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_OnGoingLoading value) onGoingLoading,
    required TResult Function(_OngoingError value) onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_OnGoingLoading value)? onGoingLoading,
    TResult? Function(_OngoingError value)? onGoingError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_OnGoingLoading value)? onGoingLoading,
    TResult Function(_OngoingError value)? onGoingError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonationListRealTimeStatusCopyWith<$Res> {
  factory $DonationListRealTimeStatusCopyWith(DonationListRealTimeStatus value,
          $Res Function(DonationListRealTimeStatus) then) =
      _$DonationListRealTimeStatusCopyWithImpl<$Res,
          DonationListRealTimeStatus>;
}

/// @nodoc
class _$DonationListRealTimeStatusCopyWithImpl<$Res,
        $Val extends DonationListRealTimeStatus>
    implements $DonationListRealTimeStatusCopyWith<$Res> {
  _$DonationListRealTimeStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Donation>? recipes});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res>
    extends _$DonationListRealTimeStatusCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = freezed,
  }) {
    return _then(_$_Data(
      freezed == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Donation>?,
    ));
  }
}

/// @nodoc

class _$_Data implements _Data {
  const _$_Data(final List<Donation>? recipes) : _recipes = recipes;

  final List<Donation>? _recipes;
  @override
  List<Donation>? get recipes {
    final value = _recipes;
    if (value == null) return null;
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DonationListRealTimeStatus.data(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Donation>? recipes) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stk) error,
    required TResult Function(List<Donation>? recipes) onGoingLoading,
    required TResult Function(
            List<Donation>? recipes, Object? e, StackTrace? stk)
        onGoingError,
  }) {
    return data(recipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Donation>? recipes)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stk)? error,
    TResult? Function(List<Donation>? recipes)? onGoingLoading,
    TResult? Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
  }) {
    return data?.call(recipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Donation>? recipes)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stk)? error,
    TResult Function(List<Donation>? recipes)? onGoingLoading,
    TResult Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(recipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_OnGoingLoading value) onGoingLoading,
    required TResult Function(_OngoingError value) onGoingError,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_OnGoingLoading value)? onGoingLoading,
    TResult? Function(_OngoingError value)? onGoingError,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_OnGoingLoading value)? onGoingLoading,
    TResult Function(_OngoingError value)? onGoingError,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data implements DonationListRealTimeStatus {
  const factory _Data(final List<Donation>? recipes) = _$_Data;

  List<Donation>? get recipes;
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$DonationListRealTimeStatusCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'DonationListRealTimeStatus.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Donation>? recipes) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stk) error,
    required TResult Function(List<Donation>? recipes) onGoingLoading,
    required TResult Function(
            List<Donation>? recipes, Object? e, StackTrace? stk)
        onGoingError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Donation>? recipes)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stk)? error,
    TResult? Function(List<Donation>? recipes)? onGoingLoading,
    TResult? Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Donation>? recipes)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stk)? error,
    TResult Function(List<Donation>? recipes)? onGoingLoading,
    TResult Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_OnGoingLoading value) onGoingLoading,
    required TResult Function(_OngoingError value) onGoingError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_OnGoingLoading value)? onGoingLoading,
    TResult? Function(_OngoingError value)? onGoingError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_OnGoingLoading value)? onGoingLoading,
    TResult Function(_OngoingError value)? onGoingError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DonationListRealTimeStatus {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? e, StackTrace? stk});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$DonationListRealTimeStatusCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? e = freezed,
    Object? stk = freezed,
  }) {
    return _then(_$_Error(
      freezed == e ? _value.e : e,
      freezed == stk
          ? _value.stk
          : stk // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.e, [this.stk]);

  @override
  final Object? e;
  @override
  final StackTrace? stk;

  @override
  String toString() {
    return 'DonationListRealTimeStatus.error(e: $e, stk: $stk)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.e, e) &&
            (identical(other.stk, stk) || other.stk == stk));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(e), stk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Donation>? recipes) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stk) error,
    required TResult Function(List<Donation>? recipes) onGoingLoading,
    required TResult Function(
            List<Donation>? recipes, Object? e, StackTrace? stk)
        onGoingError,
  }) {
    return error(e, stk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Donation>? recipes)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stk)? error,
    TResult? Function(List<Donation>? recipes)? onGoingLoading,
    TResult? Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
  }) {
    return error?.call(e, stk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Donation>? recipes)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stk)? error,
    TResult Function(List<Donation>? recipes)? onGoingLoading,
    TResult Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(e, stk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_OnGoingLoading value) onGoingLoading,
    required TResult Function(_OngoingError value) onGoingError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_OnGoingLoading value)? onGoingLoading,
    TResult? Function(_OngoingError value)? onGoingError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_OnGoingLoading value)? onGoingLoading,
    TResult Function(_OngoingError value)? onGoingError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements DonationListRealTimeStatus {
  const factory _Error(final Object? e, [final StackTrace? stk]) = _$_Error;

  Object? get e;
  StackTrace? get stk;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnGoingLoadingCopyWith<$Res> {
  factory _$$_OnGoingLoadingCopyWith(
          _$_OnGoingLoading value, $Res Function(_$_OnGoingLoading) then) =
      __$$_OnGoingLoadingCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Donation>? recipes});
}

/// @nodoc
class __$$_OnGoingLoadingCopyWithImpl<$Res>
    extends _$DonationListRealTimeStatusCopyWithImpl<$Res, _$_OnGoingLoading>
    implements _$$_OnGoingLoadingCopyWith<$Res> {
  __$$_OnGoingLoadingCopyWithImpl(
      _$_OnGoingLoading _value, $Res Function(_$_OnGoingLoading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = freezed,
  }) {
    return _then(_$_OnGoingLoading(
      freezed == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Donation>?,
    ));
  }
}

/// @nodoc

class _$_OnGoingLoading implements _OnGoingLoading {
  const _$_OnGoingLoading(final List<Donation>? recipes) : _recipes = recipes;

  final List<Donation>? _recipes;
  @override
  List<Donation>? get recipes {
    final value = _recipes;
    if (value == null) return null;
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DonationListRealTimeStatus.onGoingLoading(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnGoingLoading &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnGoingLoadingCopyWith<_$_OnGoingLoading> get copyWith =>
      __$$_OnGoingLoadingCopyWithImpl<_$_OnGoingLoading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Donation>? recipes) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stk) error,
    required TResult Function(List<Donation>? recipes) onGoingLoading,
    required TResult Function(
            List<Donation>? recipes, Object? e, StackTrace? stk)
        onGoingError,
  }) {
    return onGoingLoading(recipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Donation>? recipes)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stk)? error,
    TResult? Function(List<Donation>? recipes)? onGoingLoading,
    TResult? Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
  }) {
    return onGoingLoading?.call(recipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Donation>? recipes)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stk)? error,
    TResult Function(List<Donation>? recipes)? onGoingLoading,
    TResult Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingLoading != null) {
      return onGoingLoading(recipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_OnGoingLoading value) onGoingLoading,
    required TResult Function(_OngoingError value) onGoingError,
  }) {
    return onGoingLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_OnGoingLoading value)? onGoingLoading,
    TResult? Function(_OngoingError value)? onGoingError,
  }) {
    return onGoingLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_OnGoingLoading value)? onGoingLoading,
    TResult Function(_OngoingError value)? onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingLoading != null) {
      return onGoingLoading(this);
    }
    return orElse();
  }
}

abstract class _OnGoingLoading implements DonationListRealTimeStatus {
  const factory _OnGoingLoading(final List<Donation>? recipes) =
      _$_OnGoingLoading;

  List<Donation>? get recipes;
  @JsonKey(ignore: true)
  _$$_OnGoingLoadingCopyWith<_$_OnGoingLoading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OngoingErrorCopyWith<$Res> {
  factory _$$_OngoingErrorCopyWith(
          _$_OngoingError value, $Res Function(_$_OngoingError) then) =
      __$$_OngoingErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Donation>? recipes, Object? e, StackTrace? stk});
}

/// @nodoc
class __$$_OngoingErrorCopyWithImpl<$Res>
    extends _$DonationListRealTimeStatusCopyWithImpl<$Res, _$_OngoingError>
    implements _$$_OngoingErrorCopyWith<$Res> {
  __$$_OngoingErrorCopyWithImpl(
      _$_OngoingError _value, $Res Function(_$_OngoingError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = freezed,
    Object? e = freezed,
    Object? stk = freezed,
  }) {
    return _then(_$_OngoingError(
      freezed == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<Donation>?,
      freezed == e ? _value.e : e,
      freezed == stk
          ? _value.stk
          : stk // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$_OngoingError implements _OngoingError {
  const _$_OngoingError(final List<Donation>? recipes, this.e, [this.stk])
      : _recipes = recipes;

  final List<Donation>? _recipes;
  @override
  List<Donation>? get recipes {
    final value = _recipes;
    if (value == null) return null;
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Object? e;
  @override
  final StackTrace? stk;

  @override
  String toString() {
    return 'DonationListRealTimeStatus.onGoingError(recipes: $recipes, e: $e, stk: $stk)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OngoingError &&
            const DeepCollectionEquality().equals(other._recipes, _recipes) &&
            const DeepCollectionEquality().equals(other.e, e) &&
            (identical(other.stk, stk) || other.stk == stk));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipes),
      const DeepCollectionEquality().hash(e),
      stk);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OngoingErrorCopyWith<_$_OngoingError> get copyWith =>
      __$$_OngoingErrorCopyWithImpl<_$_OngoingError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Donation>? recipes) data,
    required TResult Function() loading,
    required TResult Function(Object? e, StackTrace? stk) error,
    required TResult Function(List<Donation>? recipes) onGoingLoading,
    required TResult Function(
            List<Donation>? recipes, Object? e, StackTrace? stk)
        onGoingError,
  }) {
    return onGoingError(recipes, e, stk);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Donation>? recipes)? data,
    TResult? Function()? loading,
    TResult? Function(Object? e, StackTrace? stk)? error,
    TResult? Function(List<Donation>? recipes)? onGoingLoading,
    TResult? Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
  }) {
    return onGoingError?.call(recipes, e, stk);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Donation>? recipes)? data,
    TResult Function()? loading,
    TResult Function(Object? e, StackTrace? stk)? error,
    TResult Function(List<Donation>? recipes)? onGoingLoading,
    TResult Function(List<Donation>? recipes, Object? e, StackTrace? stk)?
        onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingError != null) {
      return onGoingError(recipes, e, stk);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Data value) data,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_OnGoingLoading value) onGoingLoading,
    required TResult Function(_OngoingError value) onGoingError,
  }) {
    return onGoingError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Data value)? data,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_OnGoingLoading value)? onGoingLoading,
    TResult? Function(_OngoingError value)? onGoingError,
  }) {
    return onGoingError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Data value)? data,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_OnGoingLoading value)? onGoingLoading,
    TResult Function(_OngoingError value)? onGoingError,
    required TResult orElse(),
  }) {
    if (onGoingError != null) {
      return onGoingError(this);
    }
    return orElse();
  }
}

abstract class _OngoingError implements DonationListRealTimeStatus {
  const factory _OngoingError(final List<Donation>? recipes, final Object? e,
      [final StackTrace? stk]) = _$_OngoingError;

  List<Donation>? get recipes;
  Object? get e;
  StackTrace? get stk;
  @JsonKey(ignore: true)
  _$$_OngoingErrorCopyWith<_$_OngoingError> get copyWith =>
      throw _privateConstructorUsedError;
}
