import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_font.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class SettingsMenuCard extends StatelessWidget {
  const SettingsMenuCard(
      {Key? key,
      required this.icon,
      required this.name,
      required this.onPressed})
      : super(key: key);
  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(0.6),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.white.withOpacity(.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0.2, 0.6)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(icon,color: AppColors.primary,),
              ),
            ),
            SizedBox(
              width: media.width * 0.06,
            ),
            CommonText(
              text: name,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),

            // Container(
            //   width: 40,
            //   height: 40,
            //   decoration: BoxDecoration(
            //     color: AppColors.secondary,
            //     borderRadius: BorderRadius.circular(8.0),
            //     boxShadow: [
            //       BoxShadow(
            //           color: AppColors.white.withOpacity(.5),
            //           spreadRadius: 1,
            //           blurRadius: 1,
            //           offset: const Offset(0.2, 0.6)),
            //     ],
            //   ),
            //   child: const Icon(
            //     Icons.keyboard_arrow_right,
            //     color: AppColors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
