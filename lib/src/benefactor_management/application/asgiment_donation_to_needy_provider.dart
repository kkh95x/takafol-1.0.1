
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
import 'package:takafol/src/donations_mangement/domain/donation_status.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';
import 'package:takafol/src/user_management/domain/user_info.dart';

class AssgmentDonationToNeedyInput {
  AppUser appUser;
  Donation donation;
  BuildContext context;
  AssgmentDonationToNeedyInput(
      {required this.appUser, required this.donation, required this.context});
}

final assgmentDonationToNeedyProvider = FutureProvider.autoDispose
    .family<void, AssgmentDonationToNeedyInput>((ref, input) async {
  BotToast.showCustomLoading(
    toastBuilder: (cancelFunc) => const LoadingComponent(),
  );
  final needy = input.appUser;
  final donation = input.donation;
  final oldCurrentStatues = donation.currentStatus;
  final newDonation = donation.copyWith(
      currentStatus:
          DonationStatus(name: DonationState.send, createdDate: DateTime.now()),
      status: [...donation.status ?? [], oldCurrentStatues],
      needy: UserInformation(
        id: needy.id,
        name: needy.needy?.needyNumber,
        accountType: needy.accountType,
      ));
  await ref.read(donationRepositoryProvider).updateDonation(newDonation);
  if (input.context.mounted) {
    input.context.pop();
  }
  BotToast.closeAllLoading();

  BotToast.showText(text: "تم إرسال التبرع بنجاح");

  return;
  //TODO Senf notification to needy
});
