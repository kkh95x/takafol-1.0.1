import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'supabase_storge_service.g.dart';

@riverpod
SupaStorgeService storgeService(StorgeServiceRef ref) =>
    SupaStorgeService(Supabase.instance.client);

class SupaStorgeService {
  SupabaseClient supa;
  SupaStorgeService(this.supa);

  Future<String> saveFile(File file, String filePath) async {
    await supa.storage.from("users").upload(filePath, file);
    final url= supa.storage.from("users").getPublicUrl(filePath);
    return url;
  
  }
}
