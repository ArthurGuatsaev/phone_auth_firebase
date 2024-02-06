import 'dart:async';

abstract class AuthRepository {
  AuthRepository({required this.userController, this.kodController});

  Future<void> signIn({
    String? phone,
    String? name,
    String? email,
    String? password,
  });
  Future<void> logout();
  Future<void> signUp({
    String? phone,
    String? name,
    String? email,
    String? password,
  });
  final StreamController<Map<String, dynamic>> userController;
  final StreamController<String>? kodController;
}
