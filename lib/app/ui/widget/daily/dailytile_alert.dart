import 'package:flutter/material.dart';

import '../../../controllers/daily.dart';
import '../../../utility/utility.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

commonTransactionDialog(BuildContext context, {required int index}) {
  // set up the buttons

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonText(
          text: DailyController.to.dailydetails[index].isIncome == "true"
              ? "${DailyController.to.dailydetails[index].incomeName}"
              : "${DailyController.to.dailydetails[index].expenseName}",
          fontColor: DailyController.to.dailydetails[index].isIncome == "true"
              ? AppColors.primary
              : AppColors.secondary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )
      ],
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text:
                      DailyController.to.dailydetails[index].isIncome == "true"
                          ? "Income name"
                          : "Expense name",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                DailyController.to.dailydetails[index].isIncome == "true"
                    ? SizedBox()
                    : CommonText(
                        text: "Expense Category",
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                CommonText(
                  text: "Amount",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                  text: "Time",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                  text: "Date",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: ":",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                DailyController.to.dailydetails[index].isIncome == "true"
                    ? SizedBox()
                    : CommonText(
                        text: ":",
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                CommonText(
                  text: ":",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                  text: ":",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                  text: ":",
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: DailyController.to.dailydetails[index].isIncome ==
                          "true"
                      ? "${DailyController.to.dailydetails[index].incomeName}"
                      : "${DailyController.to.dailydetails[index].expenseName}",
                  fontColor:
                      DailyController.to.dailydetails[index].isIncome == "true"
                          ? AppColors.primary
                          : AppColors.secondary,
                  fontWeight: FontWeight.bold,
                ),
                DailyController.to.dailydetails[index].isIncome == "true"
                    ? SizedBox()
                    : CommonText(
                        text:
                            " ${DailyController.to.dailydetails[index].expenseCategory}"
                                .toUpperCase(),
                        fontColor: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                CommonText(
                  text:
                      "$rupee ${DailyController.to.dailydetails[index].amount}",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontColor:
                      DailyController.to.dailydetails[index].isIncome == "true"
                          ? AppColors.primary
                          : AppColors.secondary,
                ),
                CommonText(
                  text:
                      "${getIsoToLocalTime(date: DailyController.to.dailydetails[index].createdAt.toString())}",
                  fontColor: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                  text:
                      "${getIsoToLocalDate(date: DailyController.to.dailydetails[index].createdAt.toString())}",
                  fontColor: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: "Today's Income",
                  fontSize: 16,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                    text: DailyController.to.dailytotal.dailyTotalIncome != null
                        ? "+ $rupee ${DailyController.to.dailytotal.dailyTotalIncome.toString()}"
                        : "$rupee 0",
                    fontSize: 18,
                    fontColor: AppColors.primary,
                    fontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonText(
                  text: "Today's Expense",
                  fontSize: 16,
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                CommonText(
                  text: DailyController.to.dailytotal.dailyTotalExpense != null
                      ? "- $rupee ${DailyController.to.dailytotal.dailyTotalExpense.toString()}"
                      : "$rupee 0",
                  fontSize: 18,
                  fontColor: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
