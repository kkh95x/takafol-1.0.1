import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/needy_mangement/domain/needy_model.dart';
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';
// import 'package:takafol/src/user_management/data/parse_server/supabase_app_user_repository.dart';
// import 'package:takafol/src/user_management/data/supabase_app_user_repository.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';
import 'package:intl/intl.dart';

class AddNeedyProviderInput {
  BuildContext context;
  FormGroup formGroup;
  AddNeedyProviderInput({required this.context, required this.formGroup});
}

final addNeedyProvider = FutureProvider.autoDispose
    .family<void, AddNeedyProviderInput>((ref, input) async {
  final form = input.formGroup;

  final context = input.context;

  final username = form.control("username").value;
  BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => const LoadingComponent());
  final isUsernamUsed = await ref
      .read(appUserRepositoryProvider)
      .checkUsername(username)
      .onError((error, stackTrace) {
    BotToast.showText(text: error.toString());

    return true;
  });
  if (isUsernamUsed) {
    if (context.mounted) {
      context.pop();
      BotToast.showText(
          text: "حدث خطأ أو أسم مستخدم مستخدم بالفعل",
          contentColor: Colors.red);
      BotToast.closeAllLoading();
      return;
    }
  }
  final gFName = form.control("guardianFamily.name").value;
  final gSName = form.control("guardianFamily.fName").value;
  final gLName = form.control("guardianFamily.sName").value;
  final gBirthDay = form.control("guardianFamily.bithDay").value;
  final gIdType = form.control("guardianFamily.idType").value;
  final gIdnumber = form.control("guardianFamily.idNumber").value;

  final zFName = form.control("husband.name").value;
  final zSName = form.control("husband.fName").value;
  final zLName = form.control("husband.sName").value;
  final zBirthDay = form.control("husband.bithDay").value;

  final boy02 = form.control("children.boy02").value;
  final girl02 = form.control("children.girl02").value;
  final boy210 = form.control("children.boy210").value;
  final girl210 = form.control("children.girl210").value;
  final boy1020 = form.control("children.boy1020").value;
  final girl020 = form.control("children.girl020").value;
  final boy2040 = form.control("children.boy2040").value;
  final gir2040 = form.control("children.gir2040").value;
  final boy40 = form.control("children.boy40").value;
  final gir40 = form.control("children.gir40").value;

  final orphans = form.control("orphans").value;
  final specialNeeds = form.control("specialNeeds").value;
  final password = form.control("password").value;
  final point = form.control("goPoint").value as GeoPoint;

  final count = await ref.read(appUserRepositoryProvider).getLimitNeedy();
  final newNumber = getNeedyNumber(count);
  final user = AppUser(
      creatorId: ref.read(authNotiferProvider).currentUser?.id,
      firstName: gFName,
      lastName: gSName,
      username: username,
      password: password,
      latitude: point.latitude,
      longitude: point.longitude,
      needy: Needy(
          needyNumber: newNumber,
          gName: gFName,
          gSName: gSName,
          gLName: gLName,
          gIdType: gIdType,
          gIdnumber: gIdnumber,
          boy02: boy02,
          girl02: girl02,
          boy210: boy210,
          girl210: girl210,
          boy1020: boy1020,
          girl020: girl020,
          boy2040: boy2040,
          boy40: boy40,
          gir40: gir40,
          gBirthDay: gBirthDay,
          gir2040: gir2040,
          orphans: orphans,
          specialNeeds: specialNeeds,
          zBirthDay: zBirthDay,
          zFName: zFName,
          zLName: zLName,
          zSName: zSName),
      accountType: AccountType.needy);

  await ref
      .read(appUserRepositoryProvider)
      .createUser(user, cleacId: true)
      .then((
    value,
  ) {
    context.pop();
    BotToast.showText(
        text: "تم أضافة المستخدم بنجاح", contentColor: Colors.green);
    BotToast.closeAllLoading();

    BotToast.showWidget(
      toastBuilder: (cancelFunc) => AlertDialog(
        title: const Column(
          children: [Text("مستفيد جديد"), Divider()],
        ),
        content: SizedBox(
          height: 400.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(" المعرف : ${user.needy?.needyNumber}"),
              Text("أسم مستخدم: ${user.username}"),
              Text("كلمة المرور : ${user.password}")
            ],
          ),
        ),
        actions: [ElevatedButton(onPressed: cancelFunc, child:const Text("رجوع"))],
      ),
      
    );
    return;
  }).onError((error, stackTrace) {
    context.pop();
    BotToast.showText(text: error.toString(), contentColor: Colors.red);
    return;
  });
});
String getNeedyNumber(int count) {
  final number = NumberFormat('0000').format(count + 1);

  return "${DateTime.now().millisecondsSinceEpoch}$number";
}
