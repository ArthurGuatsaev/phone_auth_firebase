import 'package:firebase_regist/const/extension.dart';
import 'package:flutter/material.dart';

import '../../widgets/bn_phone.dart';
import '../../widgets/otp.dart';
import '../../widgets/step_indicator.dart';
import '../../widgets/tf_phone.dart';

class PhoneScreenPhone extends StatefulWidget {
  const PhoneScreenPhone({
    super.key,
  });

  @override
  State<PhoneScreenPhone> createState() => _PhoneScreenPhoneState();
}

class _PhoneScreenPhoneState extends State<PhoneScreenPhone> {
  late final PageController _pageController = PageController(initialPage: 0);
  late final TextEditingController _controller =
      TextEditingController(text: '+7');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: StepIndicator(pageController: _pageController),
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: 2,
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return PhoneInput(
                          controller: _controller,
                          index: index,
                          pController: _pageController,
                        );
                      case 1:
                        return OTFScreen(controller: _controller);
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneInput extends StatefulWidget {
  final int index;
  final TextEditingController controller;
  final PageController pController;
  const PhoneInput({
    super.key,
    required this.index,
    required this.controller,
    required this.pController,
  });

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(child: Text('Регистрация', style: context.text.rgTitle)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Center(
                child: Text('Введите номер телефона для регистрации',
                    textAlign: TextAlign.center, style: context.text.rgBody),
              ),
            ),
            const SizedBox(height: 30),
            Text('Номер телефона', style: context.text.rgLable),
            const SizedBox(height: 5),
            PhoneAuthTextField(controller: widget.controller),
            const SizedBox(height: 88),
            PhoneAuthButton(
                controller: widget.controller, pController: widget.pController),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Нажимая на данную кнопку, вы даете согласие на обработку персональных данных',
                textAlign: TextAlign.center,
                style: context.text.rgComment,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
