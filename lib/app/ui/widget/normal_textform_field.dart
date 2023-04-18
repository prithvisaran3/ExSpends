import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Container(
      padding: EdgeInsets.only(left: 100,right: 20,top: 5,bottom: 5),
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0.2,0.6)

          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        cursorColor: AppColors.black,
        style: TextStyle(fontSize: 17, color: AppColors.primary),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.white.withOpacity(0.4),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
