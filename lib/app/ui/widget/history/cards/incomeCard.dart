import 'package:expense/app/ui/widget/common_text.dart';
import 'package:flutter/material.dart';

import '../../../../utility/utility.dart';
import '../../../theme/colors.dart';

class Icard extends StatelessWidget {
  const Icard(
      {Key? key,
      required this.iname,
      required this.date,
      required this.iamount, required this.onLongPress})
      : super(key: key);
  final String date;
  final String iname;
  final String iamount;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: onLongPress,
        child: Container(
          padding: EdgeInsets.all(8),
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
                    "${iname.toString().length > 12 ? "${iname.substring(0, 10)}..." : iname}",
                fontColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              CommonText(
                text: "$rupee $iamount",
                fontColor: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }
}
