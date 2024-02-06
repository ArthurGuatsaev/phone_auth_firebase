part of '../router.dart';

class MyRouterDelegate extends RouterDelegate<MyNavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyNavigationState> {
  static MyRouterDelegate instance = MyRouterDelegate._();
  Map<String, Object> param = {};
  MyNavigationState? myNS;
  bool auth = true;
  @override
  final GlobalKey<NavigatorState> navigatorKey =
      MyNavigatorManager.instance.key;
  MyRouterDelegate._();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: HomePage(
            firstFlow: Navigator(
              pages: [
                const MaterialPage(child: AccountPage()),
                if (myNS?.edit == true)
                  MaterialPage(
                      child: AccountEdit(data: param['edit']!), name: 'edit')
              ],
              onPopPage: (route, result) {
                switch (route.settings.name) {
                  case 'edit':
                    myNS = MyNavigationState.home();
                    notifyListeners();
                }
                return false;
              },
            ),
          ),
        ),
        if (myNS?.auth == true)
          const MaterialPage(child: PhoneAuthPage(), name: 'auth'),
      ],
      onPopPage: onPop,
    );
  }

  @override
  MyNavigationState? get currentConfiguration => myNS;
  @override
  Future<void> setNewRoutePath(MyNavigationState configuration) async {
    myNS = configuration;
    notifyListeners();
  }

  @override
  Future<void> setInitialRoutePath(MyNavigationState configuration) async {
    if (!auth) myNS = MyNavigationState.home();
    if (auth) myNS = MyNavigationState.auth();
    notifyListeners();
  }

  bool onPop(Route<dynamic> route, dynamic result) {
    switch (route.settings.name) {
      // case 'edit':
      //   myNS = MyNavigationState.home();
      //   notifyListeners();
    }
    return false;
  }

  void notify() => notifyListeners();
}
