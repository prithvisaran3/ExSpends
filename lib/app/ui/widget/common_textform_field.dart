import 'package:flutter/material.dart';

import '../theme/colors.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.validator,
      this.obscureText,
      this.maxLength,
      this.prefixIcon,
      this.errorText,
      this.maxLines = 1,
      this.inputType,
      this.onChanged,
      this.onComplete})
      : super(key: key);
  final String hintText;

  final String? errorText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final int? maxLength;
  final int maxLines;
  final TextInputType? inputType;
  final Function(String?)? onChanged;
  final Function()? onComplete;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        // textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onComplete,
        cursorColor: AppColors.primary,
        controller: widget.controller,
        keyboardType: widget.inputType,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        obscuringCharacter: "*",
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            errorText: widget.errorText,
            hintStyle: TextStyle(
                color: AppColors.white.withOpacity(.3), fontFamily: "Oswald"),
            counterText: "",
            contentPadding: const EdgeInsets.all(12),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primary,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(.5), width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: showPassword()),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return ButtonTheme(
          child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
        child: Icon(
          passwordVisible == true ? Icons.visibility : Icons.visibility_off,
          color: AppColors.grey.withOpacity(.3),
        ),
      ));
    } else {
      return const SizedBox.shrink();
    }
  }
}
