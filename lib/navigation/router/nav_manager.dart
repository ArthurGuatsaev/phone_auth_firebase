part of '../router.dart';

class MyNavigatorManager {
  MyNavigatorManager._();
  static MyNavigatorManager instance = MyNavigatorManager._();
  final key = GlobalKey<NavigatorState>();
  static final MyRouterDelegate delegate = MyRouterDelegate.instance;
  NavigatorState? get nav => key.currentState;

  Future<void> simulatorPop() async {
    nav?.pop();
  }

  void pushAuth() {
    delegate.myNS = MyNavigationState.auth();
    delegate.notify();
  }

  void pushHome() {
    delegate.myNS = MyNavigationState.home();
    delegate.notify();
  }

  void pushEdit(String data) {
    delegate.myNS = MyNavigationState.edit();
    delegate.param['edit'] = data;
    delegate.notify();
  }

  Future<void> camara() async {
    nav!.restorablePush(showModalPick);
  }
}
