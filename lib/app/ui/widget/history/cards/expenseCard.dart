import 'package:flutter/material.dart';

import '../../../../utility/utility.dart';
import '../../../theme/colors.dart';
import '../../common_text.dart';

class Ecard extends StatelessWidget {
  const Ecard(
      {Key? key,
      required this.ename,
      required this.date,
      required this.eamount,
      required this.onLongPress})
      : super(key: key);
  final String date;
  final String ename;
  final String eamount;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onLongPress: onLongPress,
            child: Container(
              padding: EdgeInsets.all(8),
              // margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(20),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.transparent,
                //     offset: Offset(1.0, 3.0),
                //     blurRadius: .0,
                //     spreadRadius: 2.0,
                //   ),
                // ],
              ),
              child: Row(
                children: [
                  CommonText(
                    text: "$date",
                    fontColor: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  Spacer(),
                  CommonText(
                    text:
                        "${ename.toString().length > 12 ? "${ename.substring(0, 10)}..." : ename}",
                    fontColor: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  Spacer(),
                  CommonText(
                    text: "$rupee $eamount",
                    fontColor: AppColors.secondary,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
