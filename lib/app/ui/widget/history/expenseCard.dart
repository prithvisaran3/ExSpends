import 'package:flutter/material.dart';

import '../../../utility/utility.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class Ecard extends StatefulWidget {
  const Ecard(
      {Key? key,
      required this.ename,
      required this.date,
      required this.eamount})
      : super(key: key);
  final String date;
  final String ename;
  final String eamount;

  @override
  State<Ecard> createState() => _EcardState();
}

class _EcardState extends State<Ecard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
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
                  text: "${widget.date}",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.w800,
                ),
                Spacer(),
                CommonText(
                  text:
                      "${widget.ename.toString().length > 12 ? "${widget.ename.substring(0, 10)}..." : widget.ename}",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                CommonText(
                  text: "$rupee ${widget.eamount}",
                  fontColor: AppColors.secondary,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
