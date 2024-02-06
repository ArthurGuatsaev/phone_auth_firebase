import 'package:firebase_regist/const/extension.dart';
import 'package:flutter/material.dart';

class PhoneAuthTextField extends StatefulWidget {
  final TextEditingController controller;
  const PhoneAuthTextField({
    super.key,
    required this.controller,
  });

  @override
  State<PhoneAuthTextField> createState() => _PhoneAuthTextFieldState();
}

class _PhoneAuthTextFieldState extends State<PhoneAuthTextField> {
  int lastLength = 2;
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Color get isActive => widget.controller.text.length < 3
      ? context.color.stepDis
      : context.color.stepAc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: isActive),
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          keyboardType: TextInputType.phone,
          style: context.text.rgText,
          controller: widget.controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10, left: 20),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
          onChanged: (value) {
            if (value.length < 3) {
              widget.controller.text = '+7';
              return;
            }
            if (lastLength <= value.length) {
              widget.controller.text = value.lastLetter;
              lastLength = widget.controller.text.length;
              return;
            }
            widget.controller.text = value;
            lastLength = widget.controller.text.length;
          },
        ),
      ),
    );
  }
}
