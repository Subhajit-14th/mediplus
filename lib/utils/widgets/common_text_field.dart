import 'package:flutter/material.dart';
import 'package:mediplus/utils/assets/app_colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.onTap,
      this.maxLines});

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Function()? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.textColorDark,
      readOnly: onTap == null ? false : true,
      maxLines: maxLines,
      style: const TextStyle(
        color: AppColor.textColorDark,
      ),
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.textColorDark,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: AppColor.textColorDark,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: true,
        focusColor: AppColor.textColorLight,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textColorDark,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.textColorDark,
          ),
        ),
      ),
    );
  }
}
