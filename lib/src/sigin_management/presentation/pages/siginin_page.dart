import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/application/auth/auth_state.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/sigin_management/presentation/components/login_component.dart';
import 'package:takafol/src/sigin_management/presentation/components/signup_component.dart';
import 'package:takafol/src/sigin_management/presentation/components/user_infomation_component.dart';
import 'package:takafol/src/sigin_management/presentation/components/verification_component.dart';
import 'package:takafol/src/sigin_management/presentation/components/waiting_email_component.dart';
import 'package:takafol/src/user_management/application/app_user_form.dart';

class SginInPage extends ConsumerWidget {
  const SginInPage({super.key});
  static String get routeName => "sgin-in";
  static String get routePath => "/$routeName";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotiferProvider);
    final userForm = ref.read(userFormProviderProvider);
    return Scaffold(
      body: SafeArea(
        child: ReactiveForm(
          formGroup: userForm,
          child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                // ignore: invalid_use_of_protected_member
                child: getStep(user.state)),
          ),
        ),
      ),
    );
  }

  Widget getStep(AuthStatus status) {
  
    switch (status) {
      case AuthStatus.login:
        return const LoginComponent();

      case AuthStatus.unAuth:
        return const LoginComponent();
      case AuthStatus.verification:
        break;
      case AuthStatus.auth:
        return Container();
      case AuthStatus.signup:
        return const SiginUpComponent();
      case AuthStatus.registration:
        return const UserInformationComponent();
      case AuthStatus.loading:
        return const LoadingComponent();
      case AuthStatus.verify:
        return const VerificationComponent();
      case AuthStatus.waitingEmail:
        return const WaitingEmailComponent();
      default:
        return Container();
    }
    return Container();
  }
}
