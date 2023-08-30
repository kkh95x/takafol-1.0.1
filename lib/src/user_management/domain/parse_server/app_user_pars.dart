// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
// import 'package:equatable/equatable.dart';
// import 'package:takafol/constant.dart';
// import 'package:takafol/src/user_management/domain/app_user_type.dart';

// class User extends ParseObject implements ParseCloneable, EquatableMixin {
//   static const String _keyTableName = Tabels.users;

//   User({
//     String? objectId,
//     required String firstName,
//     required String lastName,
//     String? secoundName,
//     DateTime? birthday,
//     required String username,
//     required String password,
//     String? email,
//     double? latitude,
//     double? longitude,
//     String? bio,
//     // Needy? needy,
//     // BenefactorModel? benefactorModel,
//     // Admin? admin,
//     required bool isOnline,
//     required String accountType,
//     ParseFileBase? imageUrl,
//     String? creatorId,
//     required bool isActive,
//   }) : super(_keyTableName) {
//     if (objectId != null) {
//       this.objectId = objectId;
//     }
//     set<String>('username', username);
//     set<String>('firstName', firstName);
//     set<String>('lastName', lastName);
//     set<String?>('secoundName', secoundName);
//     set<DateTime?>('secoundName', birthday);
//     set<String?>('password', password);
//     set<String?>('email', email);
//     set<double?>('latitude', latitude);
//     set<double?>('longitude', longitude);
//     set<String?>('bio', bio);
//     // set<Needy?>('needy', needy);
//     // set<BenefactorModel?>('BenefactorModel', BenefactorModel);
//     // set<Admin?>('Admin', Admin);
//     set<bool>('isOnline', isOnline);
//     set<String>('accountType', accountType);

//     set<ParseFileBase?>('imageUrl', imageUrl);
//     set<String?>('creatorId', creatorId);
//     set<bool>('isActive', isActive);

//     // set<ParseFileBase?>('photo', photo);
//   }
//   User.clone()
//       : this(
//             firstName: "",
//             lastName: "",
//             username: "",
//             password: "",
//             isOnline: false,
//             accountType: "",
//             isActive: true);

//   @override
//   User clone(Map<String, dynamic> map) => User.clone()..fromJson(map);
//   String get username => get<String>('username') ?? "";
//   String get firstName => get<String>('firstName') ?? "";
//   String get lastName => get<String>('lastName') ?? "";
//   String get secoundName => get<String>('secoundName') ?? "";
//   DateTime? get birthday => get<DateTime?>('birthday');
//   String? get password => get<String?>('password');
//   String? get email => get<String?>('email');
//   double? get latitude => get<double?>('latitude');
//   double? get longitude => get<double?>('longitude');
//   String? get bio => get<String?>('bio');
// // Needy? get needy => get<String?>('needy');
// // BenefactorModel? get benefactorModel => get<benefactorModel?>('benefactorModel');
// // Admin? get admin => get<Admin?>('admin');
//   bool get isOnline => get<bool>('isOnline') ?? true;
//   String get accountType => get<String>('accountType') ?? "";
//   ParseFileBase? get imageUrl => get<ParseFileBase?>('imageUrl');
//   String? get creatorId => get<String?>('creatorId');
//   bool get isActive => get<bool>('isActive') ?? true;

//   // set<ParseFileBase?>('photo', photo);

//   @override
//   List<Object?> get props => [
//         objectId,
//         firstName,
//         secoundName,
//         birthday,
//         username,
//         password,
//         email,
//         latitude,
//         longitude,
//         bio,
//         isOnline,
//         accountType,
//         imageUrl,
//         creatorId,
//         isActive
//       ];
//   @override
//   bool? get stringify => true;

//   User copyWith(
//       {
        
//         String? objectId,
//      String? firstName,
//      String? lastName,
//     String? secoundName,
//     DateTime? birthday,
//      String? username,
//      String? password,
//     String? email,
//     double? latitude,
//     double? longitude,
//     String? bio,
//     // Needy? needy,
//     // BenefactorModel? benefactorModel,
//     // Admin? admin,
//      bool? isOnline,
//      String? accountType,
//     ParseFileBase? imageUrl,
//     String? creatorId,
//      bool? isActive,}) {
//     return User(
//       lastName: lastName??this.lastName,
//          objectId:objectId??this.objectId,
// firstName:firstName??this.firstName,
//  secoundName:secoundName??this.secoundName,
// birthday:birthday??this.birthday,
//  username:username??this.username,
// password:password??this.password??"",
// email:email??this.email,
// latitude :latitude??this.latitude,
// longitude:longitude??this.longitude,
// bio:bio??this.bio,
// isOnline:isOnline??this.isOnline,
// accountType:accountType??this.accountType,
// imageUrl:imageUrl??this.imageUrl,
//  creatorId:creatorId??this.creatorId,
// isActive:isActive??this.isActive,
       
       
//        );
//   }
// }
