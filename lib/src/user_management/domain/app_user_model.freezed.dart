// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String? get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get secoundName => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  Needy? get needy => throw _privateConstructorUsedError;
  BenefactorModel? get benefactorModel => throw _privateConstructorUsedError;
  Admin? get admin => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  AccountType get accountType => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get creatorId => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String? id,
      String firstName,
      String lastName,
      String? secoundName,
      DateTime? birthday,
      String username,
      String password,
      String? email,
      double? latitude,
      double? longitude,
      String? bio,
      Needy? needy,
      BenefactorModel? benefactorModel,
      Admin? admin,
      bool isOnline,
      AccountType accountType,
      String? imageUrl,
      String? creatorId,
      bool isActive});

  $NeedyCopyWith<$Res>? get needy;
  $BenefactorModelCopyWith<$Res>? get benefactorModel;
  $AdminCopyWith<$Res>? get admin;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? secoundName = freezed,
    Object? birthday = freezed,
    Object? username = null,
    Object? password = null,
    Object? email = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? bio = freezed,
    Object? needy = freezed,
    Object? benefactorModel = freezed,
    Object? admin = freezed,
    Object? isOnline = null,
    Object? accountType = null,
    Object? imageUrl = freezed,
    Object? creatorId = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      secoundName: freezed == secoundName
          ? _value.secoundName
          : secoundName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      needy: freezed == needy
          ? _value.needy
          : needy // ignore: cast_nullable_to_non_nullable
              as Needy?,
      benefactorModel: freezed == benefactorModel
          ? _value.benefactorModel
          : benefactorModel // ignore: cast_nullable_to_non_nullable
              as BenefactorModel?,
      admin: freezed == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as Admin?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NeedyCopyWith<$Res>? get needy {
    if (_value.needy == null) {
      return null;
    }

    return $NeedyCopyWith<$Res>(_value.needy!, (value) {
      return _then(_value.copyWith(needy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BenefactorModelCopyWith<$Res>? get benefactorModel {
    if (_value.benefactorModel == null) {
      return null;
    }

    return $BenefactorModelCopyWith<$Res>(_value.benefactorModel!, (value) {
      return _then(_value.copyWith(benefactorModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AdminCopyWith<$Res>? get admin {
    if (_value.admin == null) {
      return null;
    }

    return $AdminCopyWith<$Res>(_value.admin!, (value) {
      return _then(_value.copyWith(admin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$_AppUserCopyWith(
          _$_AppUser value, $Res Function(_$_AppUser) then) =
      __$$_AppUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String firstName,
      String lastName,
      String? secoundName,
      DateTime? birthday,
      String username,
      String password,
      String? email,
      double? latitude,
      double? longitude,
      String? bio,
      Needy? needy,
      BenefactorModel? benefactorModel,
      Admin? admin,
      bool isOnline,
      AccountType accountType,
      String? imageUrl,
      String? creatorId,
      bool isActive});

  @override
  $NeedyCopyWith<$Res>? get needy;
  @override
  $BenefactorModelCopyWith<$Res>? get benefactorModel;
  @override
  $AdminCopyWith<$Res>? get admin;
}

/// @nodoc
class __$$_AppUserCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$_AppUser>
    implements _$$_AppUserCopyWith<$Res> {
  __$$_AppUserCopyWithImpl(_$_AppUser _value, $Res Function(_$_AppUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? secoundName = freezed,
    Object? birthday = freezed,
    Object? username = null,
    Object? password = null,
    Object? email = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? bio = freezed,
    Object? needy = freezed,
    Object? benefactorModel = freezed,
    Object? admin = freezed,
    Object? isOnline = null,
    Object? accountType = null,
    Object? imageUrl = freezed,
    Object? creatorId = freezed,
    Object? isActive = null,
  }) {
    return _then(_$_AppUser(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      secoundName: freezed == secoundName
          ? _value.secoundName
          : secoundName // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      needy: freezed == needy
          ? _value.needy
          : needy // ignore: cast_nullable_to_non_nullable
              as Needy?,
      benefactorModel: freezed == benefactorModel
          ? _value.benefactorModel
          : benefactorModel // ignore: cast_nullable_to_non_nullable
              as BenefactorModel?,
      admin: freezed == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as Admin?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUser with DiagnosticableTreeMixin implements _AppUser {
  const _$_AppUser(
      {this.id,
      required this.firstName,
      required this.lastName,
      this.secoundName,
      this.birthday,
      required this.username,
      required this.password,
      this.email,
      this.latitude,
      this.longitude,
      this.bio,
      this.needy,
      this.benefactorModel,
      this.admin,
      this.isOnline = false,
      required this.accountType,
      this.imageUrl,
      this.creatorId,
      this.isActive = true});

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserFromJson(json);

  @override
  final String? id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? secoundName;
  @override
  final DateTime? birthday;
  @override
  final String username;
  @override
  final String password;
  @override
  final String? email;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? bio;
  @override
  final Needy? needy;
  @override
  final BenefactorModel? benefactorModel;
  @override
  final Admin? admin;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  final AccountType accountType;
  @override
  final String? imageUrl;
  @override
  final String? creatorId;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUser(id: $id, firstName: $firstName, lastName: $lastName, secoundName: $secoundName, birthday: $birthday, username: $username, password: $password, email: $email, latitude: $latitude, longitude: $longitude, bio: $bio, needy: $needy, benefactorModel: $benefactorModel, admin: $admin, isOnline: $isOnline, accountType: $accountType, imageUrl: $imageUrl, creatorId: $creatorId, isActive: $isActive)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUser'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('secoundName', secoundName))
      ..add(DiagnosticsProperty('birthday', birthday))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('bio', bio))
      ..add(DiagnosticsProperty('needy', needy))
      ..add(DiagnosticsProperty('benefactorModel', benefactorModel))
      ..add(DiagnosticsProperty('admin', admin))
      ..add(DiagnosticsProperty('isOnline', isOnline))
      ..add(DiagnosticsProperty('accountType', accountType))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('creatorId', creatorId))
      ..add(DiagnosticsProperty('isActive', isActive));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.secoundName, secoundName) ||
                other.secoundName == secoundName) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.needy, needy) || other.needy == needy) &&
            (identical(other.benefactorModel, benefactorModel) ||
                other.benefactorModel == benefactorModel) &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        secoundName,
        birthday,
        username,
        password,
        email,
        latitude,
        longitude,
        bio,
        needy,
        benefactorModel,
        admin,
        isOnline,
        accountType,
        imageUrl,
        creatorId,
        isActive
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      __$$_AppUserCopyWithImpl<_$_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {final String? id,
      required final String firstName,
      required final String lastName,
      final String? secoundName,
      final DateTime? birthday,
      required final String username,
      required final String password,
      final String? email,
      final double? latitude,
      final double? longitude,
      final String? bio,
      final Needy? needy,
      final BenefactorModel? benefactorModel,
      final Admin? admin,
      final bool isOnline,
      required final AccountType accountType,
      final String? imageUrl,
      final String? creatorId,
      final bool isActive}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  String? get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get secoundName;
  @override
  DateTime? get birthday;
  @override
  String get username;
  @override
  String get password;
  @override
  String? get email;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get bio;
  @override
  Needy? get needy;
  @override
  BenefactorModel? get benefactorModel;
  @override
  Admin? get admin;
  @override
  bool get isOnline;
  @override
  AccountType get accountType;
  @override
  String? get imageUrl;
  @override
  String? get creatorId;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserCopyWith<_$_AppUser> get copyWith =>
      throw _privateConstructorUsedError;
}
