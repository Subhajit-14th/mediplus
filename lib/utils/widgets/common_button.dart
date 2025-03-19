import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.width,
    required this.buttonText,
    this.height,
    this.onTap,
    required this.buttonColor,
    this.buttonTxtColor,
  });

  final double width;
  final double? height;
  final String buttonText;
  final Function()? onTap;
  final Color buttonColor;
  final Color? buttonTxtColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: buttonTxtColor ?? AppColor.textColorLight,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ),
    );
  }
}
