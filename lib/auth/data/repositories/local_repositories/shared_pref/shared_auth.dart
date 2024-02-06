import '/auth/domain/repositories/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedAuthRepository extends LocalRepository {
  SharedAuthRepository({required super.userController});
  final String _authKey = 'userAuthKey';
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  @override
  Future<Object> getUser() async {
    return (await prefs).getBool(_authKey) ?? false;
  }

  @override
  Future<void> saveUser({Object? user}) async {
    (await prefs).setBool(_authKey, true);
  }

  @override
  Future<void> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
}
