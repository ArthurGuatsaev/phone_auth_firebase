import 'package:firebase_regist/account/view/account_edit/account_edit.dart';
import 'package:firebase_regist/navigation/router.dart';
import 'package:flutter/material.dart';

import '../../../../auth/view/phone_auth/pages/auth_page.dart';
import '../../../../home/view/home.dart';

class MainNavigator {
  Map<String, Object> param;
  final GlobalKey<NavigatorState>? key;
  MyNavigationState? myNS;
  bool Function(Route<dynamic> route, dynamic result) onPop;
  MainNavigator(
      {this.key, this.myNS, required this.onPop, required this.param});
  Widget build() {
    return SizedBox();
  }
}
