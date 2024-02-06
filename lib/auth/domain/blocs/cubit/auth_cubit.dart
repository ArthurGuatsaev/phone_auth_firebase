import 'package:bloc/bloc.dart';
import 'package:firebase_regist/auth/domain/repositories/base_repository.dart';

part 'auth_state.dart';

class AuthPhoneCubit extends Cubit<AuthPhoneState> {
  final BaseAuthRepository repository;
  AuthPhoneCubit({required this.repository}) : super(AuthPhoneState());

  void requestCod(String name) async {
    await repository.authRepository.signIn(phone: name);
  }

  void responseCod(String sms) async {
    repository.authRepository.kodController?.add(sms);
  }
}
