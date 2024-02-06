import 'auth_repository.dart';
import 'local_repository.dart';

abstract interface class BaseAuthRepository {
  abstract final AuthRepository authRepository;
  abstract final LocalRepository localRepository;
}
