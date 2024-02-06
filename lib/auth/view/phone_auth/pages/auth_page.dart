import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../initialize/initialize.dart';
import '../../../domain/blocs/cubit/auth_cubit.dart';

import '../screens/phone/phone_screen_phone.dart';

class PhoneAuthPage extends StatelessWidget {
  const PhoneAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final base = InheritedDependencies.of(context).baseAuthRepository;

    return BlocProvider<AuthPhoneCubit>(
      create: (context) => AuthPhoneCubit(repository: base),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return const PhoneScreenPhone();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
