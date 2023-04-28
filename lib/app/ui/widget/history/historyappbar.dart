import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/history.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.23,
      decoration: BoxDecoration(color: AppColors.black, boxShadow: [
        BoxShadow(
          color: AppColors.grey.withOpacity(0.01),
          spreadRadius: 10,
          blurRadius: 3,
          // changes position of shadow
        ),
      ]),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 60, right: 20, left: 20, bottom: 25),
        child: Column(
          children: [
            CommonText(
              text: "History",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontColor: AppColors.primary,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expensebar(),
                      Incomebar(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector Incomebar() {
    return GestureDetector(
      onTap: () async {
        HistoryController.to.activeCategory = HistoryController.to.h2index;
        HistoryController.to.isExpense = false;
        HistoryController.to.getIncome();
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        width: 130,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border.all(
              width: 2,
              color: HistoryController.to.activeCategory ==
                      HistoryController.to.h2index
                  ? AppColors.primary
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: CommonText(
            text: "Income",
            fontColor: HistoryController.to.activeCategory ==
                    HistoryController.to.h2index
                ? AppColors.primary
                : AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  GestureDetector Expensebar() {
    return GestureDetector(
      onTap: () {
        HistoryController.to.activeCategory = HistoryController.to.h1index;
        HistoryController.to.isExpense = true;
        HistoryController.to.getExpense();
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 30,
        ),
        width: 130,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border.all(
              width: 2,
              color: HistoryController.to.activeCategory ==
                      HistoryController.to.h1index
                  ? AppColors.primary
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: CommonText(
            text: "Expense",
            fontColor: HistoryController.to.activeCategory ==
                    HistoryController.to.h1index
                ? AppColors.primary
                : AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
