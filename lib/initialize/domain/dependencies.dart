part of '../initialize.dart';

abstract interface class Dependencies {
  abstract final BaseAuthRepository baseAuthRepository;
  abstract final UserRepository userRepository;
  final Map<String, Object> context = {};
}

class MutableDependencies implements Dependencies {
  @override
  final Map<String, Object> context = {};
  @override
  late BaseAuthRepository baseAuthRepository;
  @override
  late UserRepository userRepository;

  Dependencies freeze() => UnmutableDependencies(
        baseAuthRepository: baseAuthRepository,
        userRepository: userRepository,
        context: context,
      );
}

final class UnmutableDependencies implements Dependencies {
  @override
  final BaseAuthRepository baseAuthRepository;
  @override
  final UserRepository userRepository;
  @override
  final Map<String, Object> context;
  const UnmutableDependencies({
    required this.baseAuthRepository,
    required this.userRepository,
    required this.context,
  });
}

class InheritedDependencies extends InheritedWidget {
  final Dependencies dependencies;
  const InheritedDependencies({
    required super.child,
    super.key,
    required this.dependencies,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Dependencies of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<InheritedDependencies>()!
      .dependencies;
}
