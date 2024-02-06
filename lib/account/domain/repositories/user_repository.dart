// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import '../model/user_model.dart';
import 'image_picker.dart';

abstract class UserRepository with MyPickerImage {
  StreamController<Map<String, dynamic>>? authController;
  AccountUser? user;
  Future<void> saveUser(AccountUser user);
  Future<AccountUser?> getUser(String id);
  Future<void> deleteUser(AccountUser user);
  Future<void> resete();
  UserRepository({this.authController});
}
