import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_file_picker/reactive_file_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/application/supabase_storge_service.dart';
import 'package:takafol/src/core/domain/note_model.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
import 'package:takafol/src/donations_mangement/domain/donation_status.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';
import 'package:takafol/src/user_management/domain/user_info.dart';

class CreateDonationProviderInput {
  BuildContext context;
  FormGroup formGroup;
  AppUser? needy;
  CreateDonationProviderInput(
      {required this.context, required this.formGroup, this.needy});
}

final createDonationProvider = FutureProvider.autoDispose
    .family<void, CreateDonationProviderInput>((ref, params) async {
  final user = ref.read(authNotiferProvider).currentUser;
  final context = params.context;
  final form = params.formGroup;
  final title = form.control("title").value;
  final body = form.control("body").value;
  final voices = form.control("note.voices").value as String?;
  final List<String>? images = form.control("note.images").value;
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) => const LoadingComponent(),
  );
  String? voiceUrl;
  if (voices != null) {
    final filename = "${DateTime.now()}.${voices.split(".").last}";
    voiceUrl = await ref
        .read(storgeServiceProvider)
        .saveFile(File(voices), "donations/${user?.id}/voices/$filename");
  }
  List<String>? imagesUrl;
  if (images != null && images.isNotEmpty) {
    for (var imgPath in images) {
      final filename = "${DateTime.now()}.${imgPath.split(".").last}";
      final imageUrl = await ref
          .read(storgeServiceProvider)
          .saveFile(File(imgPath), "donations/${user?.id}/$filename");
      imagesUrl ??= [];
      imagesUrl.add(imageUrl);
    }
  }
  if (params.needy == null) {
    final donation = Donation(
      title: title,
      needy: null,
      benfactor: UserInformation(
          accountType: user?.accountType,
          birthDay: user?.birthday,
          id: user?.id,
          imageUrl: user?.imageUrl,
          name: "${user?.firstName} ${user?.lastName}"),
      currentStatus: DonationStatus(
          name: DonationState.created, createdDate: DateTime.now()),
      body: body,
      createdDate: DateTime.now(),
      notes: Note(
          voiceUrl: voiceUrl == null ? null : [voiceUrl], imageUrl: imagesUrl),
    );
    await ref.read(donationRepositoryProvider).createDonation(donation);
    BotToast.closeAllLoading();
    BotToast.showText(text: "تم إنشاء التبرع بنجاح");
    if (context.mounted) {
      context.pop();
    }
       params.formGroup.reset();
       form.control("note.images").value=[];

  } else {
    final donation = Donation(
      title: title,
      currentStatus:
          DonationStatus(name: DonationState.send, createdDate: DateTime.now()),
      needy: UserInformation(
        id: params.needy?.id,
        name: params.needy?.needy?.needyNumber,
        accountType: params.needy?.accountType,
      ),
      benfactor: UserInformation(
          accountType: user?.accountType,
          birthDay: user?.birthday,
          id: user?.id,
          imageUrl: user?.imageUrl,
          name: "${user?.firstName} ${user?.lastName}"),
      body: body,
      createdDate: DateTime.now(),
      notes: Note(
          voiceUrl: voiceUrl == null ? null : [voiceUrl], imageUrl: imagesUrl),
    );
    await ref.read(donationRepositoryProvider).createDonation(donation);
    BotToast.closeAllLoading();
    BotToast.showText(text: "تم إرسال التبرع بنجاح");
   params.formGroup.reset();
          form.control("note.images").value=[];

    if (context.mounted) {
      context.pop();
    }
  }
});
