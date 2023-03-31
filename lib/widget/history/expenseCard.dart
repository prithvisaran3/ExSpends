import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';

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
                Text(
                  "${widget.date}",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Spacer(),
                Text(
                  "${widget.ename.toString().length > 12 ? "${widget.ename.substring(0, 10)}..." : widget.ename}",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "\u20B9 ${widget.eamount}",
                  style: TextStyle(
                    color: secondary,
                    fontWeight: FontWeight.w800,
                  ),
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
