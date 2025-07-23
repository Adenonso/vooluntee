import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  final Color? buttonBackgroundColor;
  final Color? buttonTextcolor;
  final VoidCallback? onTap;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? textsize;
  final Color? borderColor;
  final TextStyle? buttonTextstyle;
  const MyButtons(
      {super.key,
      required this.buttonText,
      this.buttonBackgroundColor,
      this.buttonTextcolor,
      this.onTap,
      this.buttonWidth,
      this.buttonHeight,
      this.textsize,
      this.borderColor,
      this.buttonTextstyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
            color: buttonBackgroundColor,
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextstyle ??
                TextStyle(
                    color: buttonTextcolor,
                    fontSize: textsize ?? 19,
                    fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
