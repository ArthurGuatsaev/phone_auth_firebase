// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserState {
  final AccountUser? user;
  UserState({
    this.user,
  });

  UserState copyWith({
    AccountUser? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }
}
