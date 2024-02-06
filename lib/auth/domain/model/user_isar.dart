// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';
part 'user_isar.g.dart';

@collection
class UserIsar {
  Id? id = Isar.autoIncrement;
  String? name;
  String? userId;
  UserIsar({
    this.id,
    this.name,
    this.userId,
  });

  UserIsar copyWith({
    Id? id,
    String? name,
    String? userId,
  }) {
    return UserIsar(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }
}
