import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';

final getAllNeedyProvider = StreamProvider((ref) => ref
    .read(appUserRepositoryProvider)
    .getAllNeedyAsStream());
