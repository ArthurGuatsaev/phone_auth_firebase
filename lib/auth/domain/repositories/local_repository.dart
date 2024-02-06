import 'dart:async';

abstract class LocalRepository {
  final StreamController<Map<String, dynamic>> userController;
  Future<void> saveUser({Object? user});
  Future<void> deleteUser();
  Future<Object?> getUser();
  LocalRepository({required this.userController});
}
