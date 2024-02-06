import 'package:firebase_regist/auth/domain/repositories/auth_repository.dart';

import 'package:firebase_regist/auth/domain/repositories/local_repository.dart';

import '../../../domain/repositories/base_repository.dart';

class FreezRepository implements BaseAuthRepository {
  @override
  final AuthRepository authRepository;
  @override
  final LocalRepository localRepository;

  FreezRepository(
      {required this.authRepository, required this.localRepository});
}
