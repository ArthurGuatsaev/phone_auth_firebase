part of 'base_auth_bloc.dart';

class BaseAuthEvent {}

class GetUserEvent extends BaseAuthEvent {
  final Map<String, dynamic> user;

  GetUserEvent({required this.user});
}

class LogOutEvent extends BaseAuthEvent {}
