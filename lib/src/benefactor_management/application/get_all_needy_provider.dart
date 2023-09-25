import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';

final getAllNeedyProvider = FutureProvider((ref) => ref
    .read(appUserRepositoryProvider)
    .getAllNeedyAsStream());
