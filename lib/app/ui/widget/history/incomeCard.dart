import 'package:flutter/material.dart';

import '../../../utility/utility.dart';
import '../../theme/colors.dart';

class Icard extends StatelessWidget {
  const Icard(
      {Key? key,
      required this.iname,
      required this.date,
      required this.iamount})
      : super(key: key);
  final String date;
  final String iname;
  final String iamount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            Text(
              "$date",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            ),
            Spacer(),
            Text(
              "${iname.toString().length > 12 ? "${iname.substring(0, 10)}..." : iname}",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "$rupee $iamount",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
