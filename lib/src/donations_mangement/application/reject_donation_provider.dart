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

class RejectDonationProviderInput {
  BuildContext context;
  Donation donation;
  RejectDonationProviderInput({required this.context, required this.donation});
}

final rejectDonationProvider = FutureProvider.autoDispose
    .family<void, RejectDonationProviderInput>((ref, input) async {
  final donation = input.donation;
  final context = input.context;
  final user = ref.read(authNotiferProvider).currentUser;
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) => const LoadingComponent(),
  );
  if (user?.accountType == AccountType.needy) {
    final oldState = donation.currentStatus;
    final newDonation = donation.copyWith(
        status: [...donation.status ?? [], oldState],
        needy: null,
        currentStatus: DonationStatus(
            name: DonationState.rejectFromNeed, createdDate: DateTime.now()));

    await ref.read(donationRepositoryProvider).updateDonation(newDonation);
  } else {
    final oldState = donation.currentStatus;
    final newDonation = donation.copyWith(
        status: [...donation.status ?? [], oldState],
        needy: null,
        currentStatus: DonationStatus(
            name: DonationState.rejectFromBenfactor,
            createdDate: DateTime.now()));

    await ref.read(donationRepositoryProvider).updateDonation(newDonation);
  }
  BotToast.closeAllLoading();
  BotToast.showText(text: "تم تحديث الحالة");
  if (context.mounted) {
    context.pop();
  }
});
