import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_regist/auth/domain/model/user_isar.dart';
import 'package:firebase_regist/auth/domain/repositories/base_repository.dart';
part 'base_auth_event.dart';
part 'base_auth_state.dart';

class BaseAuthBloc extends Bloc<BaseAuthEvent, BaseAuthState> {
  final void Function() navigate;
  final void Function() logout;
  final BaseAuthRepository repository;
  BaseAuthBloc({
    required this.navigate,
    required this.repository,
    required this.logout,
  }) : super(BaseAuthState()) {
    repository.authRepository.userController.stream.listen(
      (event) {
        log('user add');
        if (event['userId'] == false) return add(LogOutEvent());
        add(GetUserEvent(user: event));
      },
    );

    on<GetUserEvent>(auth);
    on<LogOutEvent>(logOut);
  }
  auth(GetUserEvent event, Emitter<BaseAuthState> emit) {
    final userAuth = UserIsar(userId: event.user['userId'] as String);
    repository.localRepository.saveUser(user: userAuth);
    navigate();
  }

  logOut(LogOutEvent event, Emitter<BaseAuthState> emit) async {
    await repository.localRepository.deleteUser();
    logout();
  }
}
