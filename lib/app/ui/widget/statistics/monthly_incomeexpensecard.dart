import 'package:expense/app/ui/widget/common_text.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class IncomeExpenseCard extends StatelessWidget {
  const IncomeExpenseCard(
      {Key? key,
      required this.icon,
      required this.name,
      required this.amount,
      this.iconColor = AppColors.black})
      : super(key: key);
  final IconData icon;
  final String name;
  final String amount;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: (size.width - 60) / 2,
      height: 170,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.01),
            spreadRadius: 10,
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              child: Center(
                  child: Icon(
                icon,
                size: 30,
                color: iconColor,
              )),
            ),
            Column(
              children: [
                CommonText(
                    text: name,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontColor: Color(0xff67727d)),
                SizedBox(
                  height: 8,
                ),
                CommonText(
                    text: amount,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontColor: AppColors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
