// import 'dart:ffi';

// import 'package:supabase_flutter/supabase_flutter.dart';

import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:takafol/constant.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';
import 'package:takafol/src/user_management/domain/app_user_type.dart';
import 'package:takafol/src/user_management/domain/parse_server/app_user_pars.dart';
import 'package:uuid/uuid.dart';

import 'app_user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'supabase_app_user_repository.g.dart';

@riverpod
AppUserRepository appUserRepository(AppUserRepositoryRef ref) =>
    SupabasAppUserRepository(const Uuid(), Supabase.instance.client);

class SupabasAppUserRepository implements AppUserRepository {
  SupabasAppUserRepository(this.uuid, this.supabaseClient);
  Uuid uuid;
  SupabaseClient supabaseClient;
  @override
  Future<bool> checkUsername(String username) async {
    try {
      final response = await supabaseClient
          .from(Tabels.users)
          .select("username")
          .eq("username", username)
          .maybeSingle();
      return (response != null);
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
  Future<void> createUser(AppUser user, {bool cleacId = false}) async {
    final body = user.toJson();
    if (cleacId) {
      body.remove("id");
    }
    await supabaseClient.from(Tabels.users).insert(body);
  }

  @override
  Stream<List<AppUser>?> getAllNeedyAsStream() {
    final response = supabaseClient
        .from(Tabels.users)
        .select<PostgrestList>()
        .eq("accountType", AccountType.needy.name)
        .asStream();
    return response.map<List<AppUser>>(
        (event) => event.map((e) => AppUser.fromJson(e)).toList());
  }

  @override
  Future<List<AppUser>?> getNeedyByCreatorId(String creatorId) async {
    final response = await supabaseClient
        .from(Tabels.users)
        .select<PostgrestList>()
        .eq("accountType", AccountType.needy.name)
        .eq("creatorId", creatorId);
    return response.map((e) => AppUser.fromJson(e)).toList();
  }

  @override
  Future<AppUser?> getUser(String id) async {
    try {
      final respone = await supabaseClient
          .from(Tabels.users)
          .select<PostgrestMap>()
          .eq("id", id)
          .single();

      return AppUser.fromJson(respone);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AppUser?> getUserByEmailPassword(
      String username, String password) async {
    final response = await supabaseClient
        .from(Tabels.users)
        .select<PostgrestMap>()
        .eq("username", username)
        .eq("password", password)
        .single();
    if (response.isEmpty) return null;
    return AppUser.fromJson(response);
  }

  @override
  Future<int> getLimitNeedy() async {
    
    final respone = await supabaseClient
        .from(Tabels.users)
        .select<PostgrestList>("id")
        .eq("accountType", AccountType.needy.name);

    return respone.length;
  }
  
  @override
  Future<bool> isEmailUsed(String email)async {
    try {
      final response = await supabaseClient
          .from(Tabels.users)
          .select("email")
          .eq("email", email)
          .maybeSingle();
      return (response != null);
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
  Stream<AppUser> getUserStream(String id) {
  final streamController= StreamController<AppUser> ();
  supabaseClient.from(Tabels.users).stream(primaryKey: ['id']).eq('id', id)
  .listen((event) {
    streamController.sink.add(AppUser.fromJson(event.first));
  });
  return streamController.stream;
  }
}
