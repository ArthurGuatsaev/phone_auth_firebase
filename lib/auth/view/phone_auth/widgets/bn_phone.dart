import 'package:firebase_regist/const/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/blocs/cubit/auth_cubit.dart';

class PhoneAuthButton extends StatefulWidget {
  const PhoneAuthButton({
    super.key,
    required this.controller,
    required this.pController,
  });

  final TextEditingController controller;
  final PageController pController;
  @override
  State<PhoneAuthButton> createState() => _PhoneAuthButtonState();
}

class _PhoneAuthButtonState extends State<PhoneAuthButton> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
            onPressed: widget.controller.text.length < 18
                ? null
                : () {
                    context
                        .read<AuthPhoneCubit>()
                        .requestCod(widget.controller.text);
                    widget.pController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear);
                  },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: context.color.stepAc,
                disabledBackgroundColor: context.color.bottomReg),
            child: Text('Отправить смс-код', style: context.text.rgButton)),
      ),
    );
  }
}
