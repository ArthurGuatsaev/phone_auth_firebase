part of '../router.dart';

class MyNavigationState extends ChangeNotifier {
  MyNavigationState.home({this.home = true});
  MyNavigationState.auth({this.auth = true});
  MyNavigationState.edit({this.home = true, this.edit = true});

  bool home = false;
  bool auth = false;
  bool edit = false;
}
