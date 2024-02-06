part of '../initialize.dart';

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencies = context
        .dependOnInheritedWidgetOfExactType<InheritedDependencies>()
        ?.dependencies;
    return MultiBlocProvider(
      providers: [
        BlocProvider<BaseAuthBloc>(
          lazy: false,
          create: (context) => BaseAuthBloc(
            navigate: MyNavigatorManager.instance.pushHome,
            logout: MyNavigatorManager.instance.pushAuth,
            repository: dependencies!.baseAuthRepository,
          ),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<UserBloc>(
            lazy: false,
            create: (context) =>
                UserBloc(repository: dependencies!.userRepository)),
      ],
      child: MyAppRouter(dependencies: dependencies),
    );
  }
}

class MyAppRouter extends StatelessWidget {
  const MyAppRouter({
    super.key,
    required this.dependencies,
  });

  final Dependencies? dependencies;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: createLightTheme(),
      routerDelegate: MyNavigatorManager.delegate,
      routeInformationParser: MyRouterInformationParser(),
    );
  }
}
