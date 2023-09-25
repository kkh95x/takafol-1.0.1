import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/src/donations_mangement/data/donation_repository.dart';
import 'package:takafol/src/donations_mangement/domain/donation.dart';
import 'package:takafol/src/donations_mangement/domain/donation_enum.dart';
part 'supa_donation_repostory.g.dart';

@riverpod
DonationRepository donationRepository(DonationRepositoryRef ref) =>
    SupaDonationRepository(Supabase.instance.client);

class SupaDonationRepository implements DonationRepository {
  SupaDonationRepository(this.supabaseClient);
  SupabaseClient supabaseClient;
  @override
  Future<void> createDonation(Donation donation) async {
    final body = donation.toJson();
    body.remove("id");
    try {
      await supabaseClient.from(Tabels.donation).insert(body).single();
    } catch (e) {
      print("----> ${e.toString()}");
    }
  }

  @override
  Future<List<Donation>?> getCreatedDonations(String benefactorId) async {
    final response = await supabaseClient
        .from(Tabels.donation)
        .select<PostgrestList>()
        // .("needy", null)
        .in_("currentStatus->>name", [DonationState.created.name,DonationState.rejectFromBenfactor.name,DonationState.rejectFromNeed.name])
        .order("created_at", ascending: false);

    return response.map((e) => Donation.fromJson(e)).toList();
  }

  @override
  Future<bool> isHaveCreatedDonations(String benefactorId) async {
    final response = await supabaseClient
        .from(Tabels.donation)
        .select<PostgrestList>("id")
        .eq("benfactor->>id", benefactorId)
        .in_("currentStatus->>name", [DonationState.created.name,DonationState.rejectFromBenfactor.name,DonationState.rejectFromNeed.name])
        .order("created_at", ascending: false);
    return response.isNotEmpty;
  }

  @override
  Future<void> updateDonation(Donation donation) async {
    try {
      await supabaseClient
          .from(Tabels.donation)
        
          .update(donation.toJson())
          .eq("id", donation.id)
          
          .single();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Donation>?> getWaitingDonations(String benefactorId) async {
    final response = await supabaseClient
        .from(Tabels.donation)
        .select<PostgrestList>()
        .eq("benfactor->>id", benefactorId)
        
        .in_("currentStatus->>name", [
      DonationState.send.name,
      DonationState.acypt.name,
      DonationState.recived.name,
    ]).order("currentStatus->>createdDate", ascending: false);

    return response.map((e) => Donation.fromJson(e)).toList();
  }

  @override
  Future<List<Donation>?> getCompelteDonations(String benefactorId) async {
    final response = await supabaseClient
        .from(Tabels.donation)
        .select<PostgrestList>()
        .eq("benfactor->>id", benefactorId)
        .eq("currentStatus->>name", DonationState.complete.name)
        .order("currentStatus->>createdDate", ascending: false);

    return response.map((e) => Donation.fromJson(e)).toList();
  }

  @override
  Future<Donation?> getDonationById(String id) async {
    try {
      final response = await supabaseClient
          .from(Tabels.donation)
          .select<PostgrestMap>()
          .eq("id", id)
          .maybeSingle();
      if (response.isEmpty) {
        return null;
      } else {
        return Donation.fromJson(response);
      }
    } on PostgrestException catch (e) {
      e;
      print(e);
      // if(e.message)
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<List<Donation>> getAllDonationByBenefactorId(String userId)async {
   try{
    final respone=await supabaseClient
    .from(Tabels.donation)
    .select<PostgrestList>()
    .eq("benfactor->>id", userId);
  
  return respone.map((e) => Donation.fromJson(e)).toList();
   }catch(e){
    debugPrint("---->Error getAllDonationByBenefactorId ${e.toString()}");
    rethrow;
   }
  }
  
  @override
  Stream<List<Donation>?> getDonationsbenfactorStream(String idBenefactor) {
   final stream=StreamController<List<Donation>?>();
   supabaseClient.from(Tabels.donation)
   .stream(primaryKey: ['id'])
   .eq("benfactor->>id", idBenefactor)
   .listen((event) {
    stream.sink.add(event.map((e) => Donation.fromJson(e)).toList());
   }); 

   return stream.stream;
  }
  
  @override
  Stream<List<Donation>?> getDonationsNeedyStream(String needyId) {
    final stream=StreamController<List<Donation>?>();
   supabaseClient.from(Tabels.donation)
   .stream(primaryKey: ['id'])
   .eq("needy->>id", needyId)
   .listen((event) {
    stream.sink.add(event.map((e) => Donation.fromJson(e)).toList());
   }); 

   return stream.stream;
  }
  
  @override
  Future<List<Donation>> getAllDonationByNeedyId(String userId)async {
   try{
    final respone=await supabaseClient
    .from(Tabels.donation)
    .select<PostgrestList>()
    .eq("needy->>id", userId);
  
  return respone.map((e) => Donation.fromJson(e)).toList();
   }catch(e){
    debugPrint("---->Error getAllDonationByBenefactorId ${e.toString()}");
    rethrow;
   }
  }
  
  }

