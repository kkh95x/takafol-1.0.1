import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:takafol/src/user_management/data/app_user_repository.dart';
import 'package:takafol/src/user_management/data/supabase/app_user_repository.dart';
import 'package:takafol/src/user_management/data/supabase/supabase_app_user_repository.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:takafol/src/user_management/domain/parse_server/app_user_pars.dart';

part 'auth_service.g.dart';

final sharedPreferencesProvider =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());
@riverpod
UserService userService(UserServiceRef ref) => UserService(
    ref.read(appUserRepositoryProvider),
    ref.read(sharedPreferencesProvider.future),
    Supabase.instance.client);

class UserService {
  SupabaseClient supa;
  UserService(this.userRepository, this.sharedPreferences, this.supa);
  AppUserRepository userRepository;
  Future<SharedPreferences> sharedPreferences;
  Future<void> sendOtp({String? email, String? phone}) async {
    await supa.auth.signInWithOtp(email: email);
    // await ParseUser(null, null, email).signUp();
  }

  Future<bool> veriyOtp(String otp, String email) async {
    final respone = await supa.auth
        .verifyOTP(type: OtpType.email, email: email, token: otp);

    return respone.session != null;
  }

  Future<String?> getIdThenClearRegister() async {
    final id = supa.auth.currentUser?.id;
    await supa.auth.signOut();
    return id;
  }

  Future<AppUser?> createNewUser(AppUser newUser) async {
    await userRepository.createUser(newUser);
    return newUser;
  }

  Future<bool> isUsernameUsed(String username) async {
    final usernameUsed = await userRepository.checkUsername(username);
    return usernameUsed;
  }
   Future<bool> isEmailUsed(String email) async {
    return await userRepository.isEmailUsed(email);
  }

  Future<AppUser?> getUserById(String id) async {
    return await userRepository.getUser(id);
  }

  Future<AppUser?> getUserByEmailAndPassword(
      String username, String password) async {
    return await userRepository.getUserByEmailPassword(username, password);
  }

  Future<void> saveUserIdInShairdPref(String userId) async {
    (await sharedPreferences).setString("userId", userId);
  }

  Future<String?> getUserIdInShairdPref() async {
    return (await sharedPreferences).getString("userId");
  }

  Future<bool> removeUserIdInShairdPref() async {
    return (await sharedPreferences).remove("userId");
  }
}
