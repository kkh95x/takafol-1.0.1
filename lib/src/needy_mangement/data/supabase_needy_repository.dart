import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'needy_reposiiory.dart';
part 'supabase_needy_repository.g.dart';

@riverpod
NeedyRepository needyRepository(NeedyRepositoryRef ref) => SupaBaseNeedyRepository();

class SupaBaseNeedyRepository implements NeedyRepository {}
