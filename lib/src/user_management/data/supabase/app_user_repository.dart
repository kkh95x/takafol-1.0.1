import 'package:takafol/src/user_management/domain/app_user_model.dart';

abstract class AppUserRepository {
  Future<void> createUser(AppUser user, {bool cleacId = false});

  Future<AppUser?> getUser(String id);
  Future<AppUser?> getUserByEmailPassword(String username, String password);
  Future<bool> checkUsername(String username);
  Future<List<AppUser>?> getNeedyByCreatorId(String creatorId);
  Future<List<AppUser>?> getAllNeedyAsStream();
  Future<int> getLimitNeedy();
  Future<bool> isEmailUsed(String email);
  Stream<AppUser> getUserStream(String id);
  Future<void>update(AppUser appUser);
  Future<String?> getTokenById(String userId);
   Future<void> delete(AppUser appUser) ;
}
