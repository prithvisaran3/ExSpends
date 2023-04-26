import 'package:expense/app/controllers/daily.dart';
import 'package:expense/app/ui/theme/colors.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:expense/app/ui/widget/common_loading.dart';
import 'package:expense/app/ui/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../json/daily_json.dart';
import '../../utility/utility.dart';

class DailyTransactions extends StatelessWidget {
  const DailyTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    final fiftyDaysAgo = today.subtract(Duration(days: 27));
    var size = MediaQuery.of(context).size;
    return GetBuilder(
      init: DailyController(),
      initState: (_) {
        DailyController.to.selectedDate = DateTime.now().toString();
        DailyController.to.getDailyTransactions();
      },
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 240, left: 20, right: 20),
                      child: Obx(
                        () => DailyController.to.dailyloading == true
                            ? CommonNormalLoading()
                            : DailyController.to.dailyEmpty == true
                                ? Column(
                                  children: [

                                    CommonText(
                                        text: "DATA EMPTY",
                                        fontColor: AppColors.white,
                                      ),
                                  ],
                                )
                                : Column(
                                    children: List.generate(
                                      DailyController.to.dailydetails.length,
                                      (index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width:
                                                      (size.width - 40) * 0.7,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 50,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              AppColors.black,
                                                              AppColors.white,
                                                            ],
                                                          ),
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors.grey
                                                              .withOpacity(0.1),
                                                        ),
                                                        child: Center(
                                                          child: Image.asset(
                                                            DailyController
                                                                        .to
                                                                        .dailydetails[
                                                                            index]
                                                                        .isIncome ==
                                                                    "true"
                                                                ? "assets/images/profit.png"
                                                                : "assets/images/loss.png",
                                                            width: 30,
                                                            height: 30,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 15),
                                                      Container(
                                                        width:
                                                            (size.width - 90) *
                                                                0.5,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CommonText(
                                                                    text: DailyController.to.dailydetails[index].isIncome ==
                                                                            "true"
                                                                        ? "${DailyController.to.dailydetails[index].incomeName}"
                                                                        : "${DailyController.to.dailydetails[index].expenseName}",
                                                                    fontSize:
                                                                        15,
                                                                    fontColor:
                                                                        AppColors
                                                                            .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                                CommonText(
                                                                    text: DailyController.to.dailydetails[index].isIncome ==
                                                                            "true"
                                                                        ? ""
                                                                        : "  (${DailyController.to.dailydetails[index].expenseCategory})"
                                                                            .toUpperCase(),
                                                                    fontSize:
                                                                        12,
                                                                    fontColor: AppColors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ],
                                                            ),
                                                            SizedBox(height: 5),
                                                            CommonText(
                                                                text:
                                                                    "${getIsoToLocalTime(date: DailyController.to.dailydetails[index].createdAt.toString())}",
                                                                fontSize: 12,
                                                                fontColor: AppColors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      (size.width - 40) * 0.3,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      CommonText(
                                                        text:
                                                            "$rupee ${DailyController.to.dailydetails[index].amount}",
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                        fontColor: DailyController
                                                                    .to
                                                                    .dailydetails[
                                                                        index]
                                                                    .isIncome ==
                                                                "true"
                                                            ? AppColors.primary
                                                            : AppColors
                                                                .secondary,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 65, top: 8),
                                              child: Divider(
                                                thickness: 0.8,
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.black,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black,
                              blurRadius: 1,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: CommonText(
                                      text: "\nTotal\n",
                                      fontSize: 16,
                                      fontColor:
                                          AppColors.white.withOpacity(0.6),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: CommonText(
                                      text: "Grand Total",
                                      fontSize: 18,
                                      fontColor: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Obx(
                                () => Column(
                                  children: [
                                    CommonText(
                                        text: DailyController.to.dailytotal
                                                    .dailyTotalIncome !=
                                                null
                                            ? "+ $rupee ${DailyController.to.dailytotal.dailyTotalIncome.toString()}"
                                            : "$rupee 0",
                                        fontSize: 18,
                                        fontColor: AppColors.primary,
                                        fontWeight: FontWeight.bold),
                                    CommonText(
                                        text: DailyController.to.dailytotal
                                                    .dailyTotalExpense !=
                                                null
                                            ? "- $rupee ${DailyController.to.dailytotal.dailyTotalExpense.toString()}"
                                            : "$rupee 0",
                                        fontSize: 18,
                                        fontColor: AppColors.secondary,
                                        fontWeight: FontWeight.bold),
                                    Divider(
                                      thickness: 2,
                                      color: AppColors.white,
                                      height: 20,
                                    ),
                                    CommonText(
                                        text: DailyController
                                                        .to.dailytotal.dailyTotalIncome !=
                                                    null &&
                                                DailyController
                                                        .to.dailytotal.dailyTotalExpense !=
                                                    null
                                            ? DailyController
                                                        .to.dailytotal.dailyTotalIncome >
                                                    DailyController.to
                                                        .dailytotal.dailyTotalExpense
                                                ? "+ $rupee ${DailyController.to.grandtotaldaily.toString()}"
                                                : "- $rupee ${DailyController.to.grandtotaldaily.abs().toString()}"
                                            : "$rupee 0",
                                        fontSize: 20,
                                        fontColor:
                                            DailyController.to.dailytotal
                                                            .dailyTotalIncome !=
                                                        null &&
                                                    DailyController
                                                            .to
                                                            .dailytotal
                                                            .dailyTotalExpense !=
                                                        null
                                                ? DailyController.to.dailytotal
                                                            .dailyTotalIncome >
                                                        DailyController
                                                            .to
                                                            .dailytotal
                                                            .dailyTotalExpense
                                                    ? AppColors.primary
                                                    : AppColors.secondary
                                                : AppColors.white,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: Get.height * 0.35,
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
                          top: 50, right: 20, left: 20, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CommonText(
                                text: "Daily Transaction",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontColor: AppColors.primary),
                          ),
                          SizedBox(
                            height: 20,
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
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
