import 'dart:async';

import 'package:isar/isar.dart';

import '../domain/model/user_model.dart';
import '../domain/repositories/user_repository.dart';

class UserRepositoryIsar extends UserRepository {
  final Isar isar;
  UserRepositoryIsar({required this.isar, super.authController});
  @override
  Future<void> deleteUser(AccountUser user) async {
    await isar.writeTxn(() async {
      await isar.accountUsers.delete(user.id!);
    });
  }

  @override
  Future<AccountUser?> getUser(String id) async {
    user = await isar.accountUsers.filter().userIdEqualTo(id).findFirst();
    return user;
  }

  @override
  Future<void> resete() async {
    await isar.writeTxn(() async {
      await isar.accountUsers.clear();
    });
  }

  @override
  Future<void> saveUser(AccountUser user) async {
    await isar.writeTxn(() async {
      await isar.accountUsers.put(user);
    });
  }
}
