import 'package:firebase_regist/const/extension.dart';
import 'package:flutter/material.dart';

class StepIndicator extends StatefulWidget {
  final PageController pageController;
  const StepIndicator({
    super.key,
    required this.pageController,
  });

  @override
  State<StepIndicator> createState() => _StepIndicatorState();
}

class _StepIndicatorState extends State<StepIndicator> {
  @override
  void initState() {
    widget.pageController.addListener(() {
      switch (widget.pageController.page) {
        case 1.0:
          pageIndex = 1;
        case 2.0:
          pageIndex = 2;
      }
      setState(() {});
    });
    super.initState();
  }

  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          child: CircleAvatar(
            backgroundColor: index == pageIndex
                ? context.color.stepAc
                : context.color.stepDis,
            radius: 20,
            child: Text('${index + 1}', style: context.text.rgBody),
          ),
        ),
      ),
    );
  }
}
