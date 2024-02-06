part of '../initialize.dart';

Future<Dependencies> $initializeDependencies(
    {Function(int progress, String message)? onProgress}) async {
  final dependencies = MutableDependencies();
  final totalStaps = _initializationSteps.length;
  var currentStep = 0;
  for (final step in _initializationSteps.entries) {
    currentStep++;
    final percent = (currentStep * 100 ~/ totalStaps).clamp(0, 100);
    onProgress?.call(percent, step.key);
    await step.value(dependencies);
    log('initialization: $currentStep/$totalStaps ($percent) | ${step.key}');
  }
  return dependencies.freeze();
}

typedef _InitializationStep = FutureOr<void> Function(
    MutableDependencies dependencies);
final Map<String, _InitializationStep> _initializationSteps =
    <String, _InitializationStep>{
  'Isar initialization': (dependencies) async {
    final appDir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open([UserIsarSchema, AccountUserSchema],
        directory: appDir.path);
    dependencies.context['isar'] = isar;
  },
  'Auth repository': (dependencies) async {
    final userController = StreamController<Map<String, dynamic>>.broadcast();
    final kodController = StreamController<String>();
    final auth = FirebasePhoneAuth(
        userController: userController, kodController: kodController);
    final local = IsarLocalAuth(
        userController: userController,
        isar: dependencies.context['isar'] as Isar);
    final key = await local.getUser();
    if (key != null) {
      dependencies.context['auth'] = key;
    }
    final freez = FreezRepository(localRepository: local, authRepository: auth);
    dependencies.baseAuthRepository = freez;
  },
  'User initialization': (dependencies) async {
    final user = UserRepositoryIsar(
        isar: dependencies.context['isar'] as Isar,
        authController:
            dependencies.baseAuthRepository.authRepository.userController);
    // получаем данные об аунтефикации
    final authData = dependencies.context['auth'];
    if (authData != null) {
      // если есть дата то значит данные аунтефикации подставляем а репо юзера
      final id = (authData as UserIsar).userId!;
      await user.getUser(id);
    }
    dependencies.userRepository = user;
  },
  'Delegate initialization': (dependencies) {
    MyNavigatorManager.delegate.auth = dependencies.context['auth'] == null;
  },
};
