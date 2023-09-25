import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/src/core/application/auth/auh_notifer.dart';
import 'package:takafol/src/donations_mangement/data/supa_donation_repostory.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';

final streamMyDonationsNeedy =StreamProvider((ref) {
   final user=ref.read(authNotiferProvider).currentUser;
  final repostory=ref.read(donationRepositoryProvider);
   final stream=StreamController<List<Donation>?>(); 
Supabase.instance.client.realtime.channel('public:${Tabels.donation}').on(RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: Tabels.donation),
    (payload, [ref]) async{
      
      
     repostory.getAllDonationByNeedyId(user?.id??"").then((value) {
     stream.sink.add(value);

     });

}).subscribe();

 ref.read(donationRepositoryProvider).getAllDonationByNeedyId(user?.id??"").then((value) {
 stream.sink.add(value);
 });
    
   return stream.stream;

}
// ref.read(donationRepositoryProvider).getDonationsNeedyStream(ref.read(authNotiferProvider).currentUser?.id??"")
);
