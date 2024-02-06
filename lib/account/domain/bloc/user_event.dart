part of 'user_bloc.dart';

abstract class UserEvent {}

class UpdateUserEvent extends UserEvent {
  final String? id;

  UpdateUserEvent({this.id});
}

class ReseteUserEvent extends UserEvent {}

class SaveUserEvent extends UserEvent {
  final AccountUser user;

  SaveUserEvent({required this.user});
}

class DeleteUserEvent extends UserEvent {
  final AccountUser user;

  DeleteUserEvent({required this.user});
}

class PickImageEvent extends UserEvent {}

class PickPhotoEvent extends UserEvent {
  final ImageSource source;
  PickPhotoEvent({required this.source});
}

class SaveNewUser extends UserEvent {
  final Map<String, dynamic> data;

  SaveNewUser({required this.data});
}
