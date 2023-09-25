import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
import 'package:takafol/src/donations_mangement/domain/donation_status.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';

class ChangeDonationProviderInput {
  BuildContext context;
  Donation donation;
  DonationState newState;
  ChangeDonationProviderInput({required this.context, required this.donation,required this.newState});
}

final changeDonationProvider = FutureProvider.autoDispose
    .family<void, ChangeDonationProviderInput>((ref, input) async {
  final donation = input.donation;
  final context = input.context;
  final newState=input.newState;
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) => const LoadingComponent(),
  );

    final oldState = donation.currentStatus;
    final newDonation = donation.copyWith(
        status: [...donation.status ?? [], oldState],
        needy: null,
        currentStatus: DonationStatus(
            name:newState, createdDate: DateTime.now()));

    await ref.read(donationRepositoryProvider).updateDonation(newDonation);
 
  BotToast.closeAllLoading();
  BotToast.showText(text: "تم تحديث الحالة");
  if (context.mounted) {
    context.pop();
  }
});
