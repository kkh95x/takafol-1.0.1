import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

final streamUser=StreamProvider.family<AppUser?,String>((ref,id) => ref.read(appUserRepositoryProvider).getUserStream(id));