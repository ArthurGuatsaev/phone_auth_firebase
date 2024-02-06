import '/auth/domain/model/user_isar.dart';
import '/auth/domain/repositories/local_repository.dart';
import 'package:isar/isar.dart';

class IsarLocalAuth extends LocalRepository {
  IsarLocalAuth({required super.userController, required this.isar});
  Isar isar;

  @override
  Future<Object?> getUser() async {
    return await isar.userIsars.where().findFirst();
  }

  @override
  Future<void> saveUser({Object? user}) async {
    await isar.writeTxn(() async {
      await isar.userIsars.put(user as UserIsar);
    });
  }

  @override
  Future<void> deleteUser() async {
    await isar.writeTxn(() async {
      await isar.userIsars.clear();
    });
  }
}
