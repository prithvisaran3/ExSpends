
import 'package:flutter/material.dart';

import '../theme/colors.dart';



class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key,
      required this.text,
      this.fontSize = 16,
      this.fontColor = AppColors.black,
      this.fontWeight,
      this.letterSpacing,
      this.textAlign, this.fontFamily})
      : super(key: key);
  final String text;
  final double fontSize;
  final double? letterSpacing;
  final Color? fontColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
          fontFamily: fontFamily??"Poppins",
          letterSpacing: letterSpacing),
    );
  }
}
