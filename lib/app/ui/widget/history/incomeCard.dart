import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class Icard extends StatefulWidget {
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
  State<Icard> createState() => _IcardState();
}

class _IcardState extends State<Icard> {
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
              "${widget.date}",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            ),
            Spacer(),
            Text(
              "${widget.iname.toString().length > 12 ? "${widget.iname.substring(0, 10)}..." : widget.iname}",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              "\u20B9 ${widget.iamount}",
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
