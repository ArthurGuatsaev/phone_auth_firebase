import 'dart:async';
import 'package:firebase_regist/auth/domain/blocs/cubit/auth_cubit.dart';
import 'package:firebase_regist/const/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OTFScreen extends StatelessWidget {
  final TextEditingController? controller;
  const OTFScreen({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Center(child: Text('Подтверждение', style: context.text.rgTitle)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Text(
                'Введите код, который мы отправили в SMS на ${controller?.text}',
                textAlign: TextAlign.center,
                style: context.text.rgBody),
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 100,
          child: Pinput(
              defaultPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  textStyle: context.text.rgCode,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: context.color.bottomReg)))),
              length: 6,
              onCompleted: (value) {
                context.read<AuthPhoneCubit>().responseCod(value);
              }),
        ),
        const SizedBox(height: 20),
        const Center(child: TimerCod(timer: 60)),
      ],
    );
  }
}

class TimerCod extends StatefulWidget {
  final int timer;
  const TimerCod({
    super.key,
    required this.timer,
  });

  @override
  State<TimerCod> createState() => _TimerCodState();
}

class _TimerCodState extends State<TimerCod> {
  late Timer timer;
  @override
  void initState() {
    value = widget.timer;
    timer = Timer.periodic(const Duration(seconds: 1), (tick) {
      value = value - 1;
      if (value == 0) tick.cancel();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  late int value;

  @override
  Widget build(BuildContext context) {
    if (value == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Отправить код еще раз',
              style: context.text.rgBody,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Text('$value сек до повтора отправки кода',
                style: context.text.rgBody)),
      ],
    );
  }
}
