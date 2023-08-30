import 'dart:async';
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/src/admin_management/domain/admin_enum.dart';
import 'package:takafol/src/admin_management/domain/admin_model.dart';
// import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:takafol/src/admin_management/domain/admin_enum.dart';
// import 'package:takafol/src/admin_management/domain/admin_model.dart';
// import 'package:takafol/src/benefactor_management/domain/benefactor_model.dart';
import 'package:takafol/src/core/application/auth/auth_service/auth_service.dart';
import 'package:takafol/src/core/application/auth/auth_state.dart';
import 'package:takafol/src/core/application/supabase_storge_service.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';
// import 'package:gotrue/src/types/auth_exception.dart' as ex;
// import 'package:takafol/src/user_management/domain/app_user_model.dart';
import 'package:takafol/src/user_management/domain/parse_server/app_user_pars.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';

final authNotiferProvider = StateNotifierProvider<AuthNotifer, UserAuthState>(
    (ref) => AuthNotifer(
        ref.read(userServiceProvider), ref.read(storgeServiceProvider)));

class AuthNotifer extends StateNotifier<UserAuthState> {
  AuthNotifer(this.userService, this.storgeService)
      : super(const UserAuthState(state: AuthStatus.loading)) {
    userService.getUserIdInShairdPref().then((userId) async {
      if (userId == null) {
        state = const UserAuthState(state: AuthStatus.unAuth);
      } else {
        final user = await userService.getUserById(userId);
        if (user == null) {
          state = const UserAuthState(state: AuthStatus.unAuth);
        } else {
          state = UserAuthState(
            state: AuthStatus.auth,
            currentUser: user,
          );
        }
      }
    });
  }
  // late final StreamSubscription<AuthState> _authStateSubscription;

  // SupabaseClient supabase;
  UserService userService;
  SupaStorgeService storgeService;
  void changeState(AuthStatus newStatus) {
    state = UserAuthState(state: newStatus);
  }

  Future<void> login(FormGroup formGroup) async {
    final username = formGroup.control("username").value;
    final password = formGroup.control("password").value;
    BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => const LoadingComponent());
    try {
      final isUser = await userService.isUsernameUsed(username);
      if (isUser) {
        final user =
            await userService.getUserByEmailAndPassword(username, password);
        if (user == null) {
          BotToast.showText(
              text: "كلمة السر غلط",
              clickClose: true,
              contentColor: Colors.red,
              duration: const Duration(seconds: 5));
        } else {
          await userService.saveUserIdInShairdPref(user.id!);
          state = UserAuthState(state: AuthStatus.auth, currentUser: user);
        }
      } else {
        BotToast.showText(
            text: " أسم المستخدم وكلمة السر غلط ",
            clickClose: true,
            contentColor: Colors.red,
            duration: const Duration(seconds: 5));
      }
    } catch (e) {
      print("---> ${e.toString()}");
      BotToast.showText(
          text: e.toString(),
          clickClose: true,
          contentColor: Colors.red,
          duration: const Duration(seconds: 5));
    }
    BotToast.closeAllLoading();
  }

  Future<void> sendOtp(FormGroup form) async {
    final isPhone = form.control("isPhone").value;
    final email = form.control("email").value as String?;
    // final phone = form.control("phone").value as PhoneNumber?;

    BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => const LoadingComponent());
    if (isPhone) {
      // try {
      //   await userService.sendOtp(phone: phone!.international);
      //   state = const UserAuthState(state: AuthStatus.verify);
      // } on ex.AuthException catch (e) {
      //   BotToast.showText(
      //       text: "خطأ ${e.message}",
      //       clickClose: true,
      //       contentColor: Colors.red,
      //       duration: const Duration(seconds: 5));
      // } catch (e) {
      //   if (e.toString() ==
      //       "Failed host lookup: 'fzpavywwvyjfacwzgvwk.supabase.co'") {
      //     BotToast.showText(
      //         text: "غير قادر على الإتصال بالسيرفر",
      //         clickClose: true,
      //         contentColor: Colors.red,
      //         duration: const Duration(seconds: 5));
      //   } else {
      //     BotToast.showText(
      //         text: "خطأ ${e.toString()}",
      //         clickClose: true,
      //         contentColor: Colors.red,
      //         duration: const Duration(seconds: 5));
      //   }
      // }
    } else {
      try {
        final isEmailUsed = await userService.isEmailUsed(email!);
        if (isEmailUsed) {
          BotToast.showText(
              text: "الأيميل مستخدم بالفعل",
              clickClose: true,
              contentColor: Colors.red,
              duration: const Duration(seconds: 5));
          BotToast.closeAllLoading();
          return;
        }

        await userService.sendOtp(email: email);
        state = UserAuthState(state: AuthStatus.verify, email: email);
        // _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
        //   final session = data.session;
        //   if (session != null) {
        //     final userId = session.user.id;
        //     state = UserAuthState(
        //         state: AuthStatus.registration, uid: userId, email: email);
        //     _authStateSubscription.cancel();
        //   }
        // });
        // } on ex.AuthException catch (e) {
        //   print("--->${e.toString()}");
        //   if (e.statusCode == "429") {
        //     BotToast.showText(
        //         text: "تم حظر الجهاز مؤقتاَ",
        //         clickClose: true,
        //         contentColor: Colors.red,
        //         duration: const Duration(seconds: 5));
        //   } else {
        //     BotToast.showText(
        //         text: "خطأ ${e.message}",
        //         clickClose: true,
        //         contentColor: Colors.red,
        //         duration: const Duration(seconds: 5));
        //   }
      } on AuthException catch (e) {
        if (e.message ==
            "For security purposes, you can only request this once every 60 seconds") {
          BotToast.showText(
              text: "يرجى الإنتظار 60 ثانية حتى طلب الرمز مرة أخرى",
              clickClose: true,
              contentColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
        if (e.message == "Email rate limit exceeded") {
          BotToast.showText(
              text: "تم تجاوز حد معدل البريد الإلكتروني",
              clickClose: true,
              contentColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
        if (e.toString() ==
            "Failed host lookup: 'fzpavywwvyjfacwzgvwk.supabase.co'") {
          BotToast.showText(
              text: "غير قادر على الإتصال بالسيرفر",
              clickClose: true,
              contentColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
      } catch (e) {
        debugPrint("--->Error:${e.toString()}");
        if (e.toString() ==
            "Failed host lookup: 'fzpavywwvyjfacwzgvwk.supabase.co'") {
          BotToast.showText(
              text: "غير قادر على الإتصال بالسيرفر",
              clickClose: true,
              contentColor: Colors.red,
              duration: const Duration(seconds: 5));
        } else {
          print("--->${e.toString()}");
          BotToast.showText(
              text: "خطأ ${e.toString()}",
              clickClose: true,
              contentColor: Colors.red,
              duration: const Duration(seconds: 5));
        }
      }
    }
    BotToast.closeAllLoading();
  }

  Future<void> createUserInfo(FormGroup formGroup) async {
    final email = state.email;
    final id = state.uid;
    final name = formGroup.control("userImformation.name").value as String;
    final surName =
        formGroup.control("userImformation.surname").value as String?;
    final birthday =
        formGroup.control("userImformation.birthDay").value as DateTime;
    final secoundName =
        formGroup.control("userImformation.secoundName").value as String?;
    final username =
        formGroup.control("userImformation.username").value as String;
    final password =
        formGroup.control("userImformation.password").value as String;
    final image = formGroup.control("userImformation.image").value as XFile?;
    final location =
        formGroup.control("userImformation.location").value as GeoPoint;
    BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => const LoadingComponent());
    String? imageUrl;
    if (image != null) {
      // imageUrl = ParseFile(File(image.path));
      // await imageUrl.save();
      final type = image.path.split(".").last;
      imageUrl = await storgeService.saveFile(
          File(image.path), "pics/$email/${DateTime.now()}.$type");
    }
    final user = AppUser(
        id: id,
        firstName: name,
        secoundName: secoundName,
        birthday: birthday,
        email: email,
        latitude: location.latitude,
        longitude: location.longitude,
        imageUrl: imageUrl,
        lastName: surName ?? "-",
        username: username,
        password: password,
        isOnline: false,
        isActive: true,

        // benefactorModel: const BenefactorModel(notes: [], starsCount: 0),
        accountType: AccountType.benfactor);
    try {
      final newUser = await userService.createNewUser(user);
      if (newUser != null) {
        state = UserAuthState(state: AuthStatus.auth, currentUser: newUser);
        await userService.saveUserIdInShairdPref(user.id!);
      } else {
        BotToast.showText(text: "حدث خطأ أثناء لنشاء الحساب");
      }
    } catch (e) {
      BotToast.showText(text: e.toString());
      print("---> ${e.toString()}");
    }
    BotToast.closeAllLoading();
  }

  Future<void> checkOtp(FormGroup form) async {
    BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => const LoadingComponent());
    final otp = form.control("sginUp.verification.verificationCode").value;
    final isVerify = await userService.veriyOtp(otp, state.email ?? "");
    if (isVerify) {
      final id = await userService.getIdThenClearRegister();

      state = UserAuthState(
          state: AuthStatus.registration, email: state.email, uid: id);
    } else {
      BotToast.showText(
          text: "رمز خطأ",
          clickClose: true,
          contentColor: Colors.red,
          duration: const Duration(seconds: 5));
    }
  }

  Future<void> logout() async {
    BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => const LoadingComponent());
    await userService.removeUserIdInShairdPref();

    // await supabase.auth.signOut();
    state = const UserAuthState(state: AuthStatus.unAuth);
  }
}
