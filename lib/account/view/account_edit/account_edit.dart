import 'package:flutter/material.dart';

import 'screens/phone/account_edit_phone.dart';

class AccountEdit extends StatelessWidget {
  final Object data;
  const AccountEdit({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return const AccountEditPhone();
      }
      return const SizedBox();
    });
  }
}
