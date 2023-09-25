// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:takafol/src/core/application/auth/auh_notifer.dart';
// import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
// import 'package:takafol/src/donations_mangement/domain/donation.dart';
// part 'dontions_providers.freezed.dart';
// // final streamCreatedDontion = StreamProvider((ref) => ref
// //     .read(donationRepositoryProvider)
// //     .getStreamCreatedDonations(
// //         ref.read(authNotiferProvider).currentUSer?.id ?? '-'));

// @freezed
// class DonationListRealTimeStatus with _$DonationListRealTimeStatus {
//   const factory DonationListRealTimeStatus.data(List<Donation>? recipes) = _Data;
//   const factory DonationListRealTimeStatus.loading() = _Loading;
//   const factory DonationListRealTimeStatus.error(Object? e, [StackTrace? stk]) =
//       _Error;
//   const factory DonationListRealTimeStatus.onGoingLoading(List<Donation>? recipes) =
//       _OnGoingLoading;
//   const factory DonationListRealTimeStatus.onGoingError(
//      List<Donation>? recipes, Object? e,
//       [StackTrace? stk]) = _OngoingError;
// }


// final createdDontionProvider = StateNotifierProvider<CreatedDonationProvider,AsyncValue<List<Donation>?>>((ref) => CreatedDonationProvider(ref)..init());
// final waitingDontionProvider = StateNotifierProvider<WaitingDonationProvider,AsyncValue<List<Donation>?>>((ref) => WaitingDonationProvider(ref)..init());
// final completeDontionProvider = StateNotifierProvider<CompleteDonationProvider,AsyncValue<List<Donation>?>>((ref) => CompleteDonationProvider(ref)..init());

// class WaitingDonationProvider
//     extends StateNotifier<AsyncValue<List<Donation>?>> {
//   WaitingDonationProvider(this.ref) : super(const AsyncLoading());
//   Ref ref;
//   init() async {
//     state = const AsyncLoading();
//     final data = await ref.read(donationRepositoryProvider).getWaitingDonations(
//         ref.read(authNotiferProvider).currentUser?.id ?? '-');
//     state = AsyncData(data);
//   }
// }

// class CreatedDonationProvider
//     extends StateNotifier<AsyncValue<List<Donation>?>> {
//   CreatedDonationProvider(this.ref) : super(const AsyncLoading());
//   Ref ref;
//   init() async {
//     state = const AsyncLoading();
//     final data = await ref
//     .read(donationRepositoryProvider)
//     .getCreatedDonations(ref.read(authNotiferProvider).currentUser?.id ?? '-');
//     state = AsyncData(data);
//   }
// }


// class CompleteDonationProvider
//     extends StateNotifier<AsyncValue<List<Donation>?>> {
//   CompleteDonationProvider(this.ref) : super(const AsyncLoading());
//   Ref ref;
//   init() async {
//     state = const AsyncLoading();
//     final data = await ref
//     .read(donationRepositoryProvider)
//     .getCompelteDonations(ref.read(authNotiferProvider).currentUser?.id ?? '-');
//     state = AsyncData(data);
//   }
// }