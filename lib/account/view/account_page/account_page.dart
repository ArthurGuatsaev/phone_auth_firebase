import 'package:flutter/material.dart';

import 'screens/phone/account_phone.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return const AccountPhone();
      }
      return const SizedBox();
    });
  }
}
