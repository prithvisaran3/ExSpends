
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';

import '../theme/app_font.dart';
import 'common_text.dart';


class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width - 250,
        margin: const EdgeInsets.all(10.0),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: primary,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonText(
              text: text,
              fontColor: black,
              fontSize: AppFontSize.eighteen,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
