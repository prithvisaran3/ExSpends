import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/daily.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class DailyAppBar extends StatelessWidget {
  const DailyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final fiftyDaysAgo = today.subtract(Duration(days: 27));
    return Container(
      height: Get.height * 0.27,
      decoration: BoxDecoration(
        color: AppColors.black,
        // boxShadow: [
        //   BoxShadow(
        //     color: grey.withOpacity(0.01),
        //     spreadRadius: 10,
        //     blurRadius: 3,
        //     // changes position of shadow
        //   ),
        // ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 60, right: 20, left: 20, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CommonText(
                  text: "Daily Transactions",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontColor: AppColors.primary),
            ),
            SizedBox(
              height: 15,
            ),
            DatePicker(
              fiftyDaysAgo,
              width: 60,
              height: 76,
              daysCount: 30,
              controller: DailyController.to.controller,
              initialSelectedDate: DateTime.now(),
              deactivatedColor: AppColors.white,
              selectionColor: AppColors.primary,
              selectedTextColor: AppColors.black,
              monthTextStyle: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
              dayTextStyle: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
              dateTextStyle: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
              onDateChange: (date) {
                DailyController.to.selectedDate = date.toString();
                print(
                    "selected date is ${DailyController.to.selectedDate}");
                DailyController.to.getDailyTransactions();
              },
            ),
          ],
        ),
      ),
    );
  }
}
