// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
part 'user_model.g.dart';

@collection
class AccountUser {
  Id? id = Isar.autoIncrement;
  String? name;
  String? userId;
  String? lastName;
  String? imagePath;
  AccountUser({this.id, this.name, this.userId, this.lastName, this.imagePath});

  AccountUser copyWith({
    Id? id,
    String? name,
    String? userId,
    String? lastName,
    String? imagePath,
  }) {
    return AccountUser(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      lastName: lastName ?? this.lastName,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @ignore
  Future<FileImage?> get userImage async {
    try {
      if (imagePath == null) return null;
      return FileImage(File(imagePath!));
    } catch (e) {
      return null;
    }
  }
}
