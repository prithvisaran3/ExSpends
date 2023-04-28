import 'package:flutter/material.dart';

import '../../../theme/app_font.dart';
import '../../../theme/colors.dart';
import '../../common_text.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 15,
    this.textColor = AppColors.white,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        CommonText(
          text: text,
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontColor: textColor,
        ),
      ],
    );
  }
}
