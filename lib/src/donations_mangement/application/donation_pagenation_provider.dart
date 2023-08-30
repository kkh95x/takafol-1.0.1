





import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';


final donationsStreamNotificationProvider =
    AsyncNotifierProvider.autoDispose<DonationPagenationProvider, List<Donation>?>(() {
  return DonationPagenationProvider(Supabase.instance.client);
});

class DonationPagenationProvider extends AutoDisposeAsyncNotifier<List<Donation>?>{
DonationPagenationProvider(this.supabase);
  SupabaseClient supabase;
  @override
  FutureOr<List<Donation>?> build() async{
    final user=ref.read(authNotiferProvider).currentUser;
    final donationRepo=ref.read(donationRepositoryProvider);


    
supabase.channel('public:${Tabels.donation}').on(RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: Tabels.donation),
    (payload, [ref]) async{
       print("------> ChannelFilter $payload donation  $ref");
      
     state= AsyncData(await donationRepo.getAllDonationByBenefactorId(user?.id??""));
 
}).subscribe();

//     supabase.channel('*').on(
//   RealtimeListenTypes.postgresChanges,
  
//   ChannelFilter(event: '*', schema: '*',filter: "",table: Tabels.donation),
//   (payload, [ref])async {
  
   
//   },
// ).subscribe();

return await donationRepo.getAllDonationByBenefactorId(user?.id??"");
  }

}

