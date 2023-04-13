import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CommonNormalTextFormField extends StatelessWidget {
  const CommonNormalTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.validator})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: AppColors.black,
      style: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: AppColors.white),
      decoration: InputDecoration(hintText: hintText, border: InputBorder.none),
    );
  }
}
