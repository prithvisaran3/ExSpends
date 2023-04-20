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
    final fiftyDaysAgo = today.subtract(Duration(days: 29));
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
                          const EdgeInsets.only(top: 200, left: 20, right: 20),
                      child: Obx(
                        () => DailyController.to.dailyloading == true
                            ? CommonNormalLoading()
                            : DailyController.to.dailyEmpty == true
                                ? CommonText(
                                    text: "DATA EMPTY",
                                    fontColor: AppColors.white,
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
                                                                        : "  (${DailyController.to.dailydetails[index].expenseCategory})",
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
                      child: Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 80),
                            child: CommonText(
                              text: "Total",
                              fontSize: 16,
                              fontColor: AppColors.white.withOpacity(0.4),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              children: [
                                CommonText(
                                    text: "$rupee 1780.00",
                                    fontSize: 20,
                                    fontColor: AppColors.white,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: Get.height * 0.33,
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
                          top: 40, right: 20, left: 20, bottom: 25),
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
