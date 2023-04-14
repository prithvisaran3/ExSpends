import 'package:expense/app/controllers/daily.dart';
import 'package:expense/app/ui/theme/colors.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:expense/app/ui/widget/common_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../json/daily_json.dart';
import '../../utility/utility.dart';

class DailyTransactions extends StatelessWidget {
  const DailyTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          padding: const EdgeInsets.only(
                              top: 200, left: 20, right: 20),
                          child: Obx(
                            () => DailyController.to.dailyloading == true
                                ? CommonNormalLoading()
                                : DailyController.to.dailyEmpty == true
                                    ? Text(
                                        "DATA EMPTY",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      )
                                    : Column(
                                        children: List.generate(
                                          DailyController
                                              .to.dailydetails.length,
                                          (index) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: (size.width - 40) *
                                                          0.7,
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
                                                                  AppColors
                                                                      .black,
                                                                  AppColors
                                                                      .white,
                                                                ],
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .grey
                                                                  .withOpacity(
                                                                      0.1),
                                                            ),
                                                            child: Center(
                                                              child:
                                                                  Image.asset(DailyController
                                                                      .to
                                                                      .dailydetails[index]
                                                                      .isIncome ==
                                                                      "true"?
                                                                "assets/images/profit.png": "assets/images/loss.png",
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 15),
                                                          Container(
                                                            width: (size.width -
                                                                    90) *
                                                                0.5,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  DailyController
                                                                              .to
                                                                              .dailydetails[index]
                                                                              .isIncome ==
                                                                          "true"
                                                                      ? "${DailyController.to.dailydetails[index].incomeName}"
                                                                      : "${DailyController.to.dailydetails[index].expenseName}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      color: AppColors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                Text(
                                                                  DailyController
                                                                              .to
                                                                              .dailydetails[index]
                                                                              .isIncome ==
                                                                          "true"
                                                                      ? ""
                                                                      : "${DailyController.to.dailydetails[index].expenseCategory}",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: AppColors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.5),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: (size.width - 40) *
                                                          0.3,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            "$rupee ${DailyController.to.dailydetails[index].amount}",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 15,
                                                              color:DailyController
                                                                  .to
                                                                  .dailydetails[index]
                                                                  .isIncome ==
                                                                  "true"?
                                                                  AppColors.primary:AppColors.secondary,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 80),
                                child: Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.white.withOpacity(0.4),
                                      fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Column(
                                  children: [
                                    Text(
                                      "\u20B91780.00",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Daily Transaction",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary),
                                  ),
                                  Icon(
                                    Icons.search,
                                    color: AppColors.primary,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              DatePicker(
                                DateTime.now(),
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
                                  DailyController.to.selectedDate =
                                      date.toString();
                                  print(
                                      "selected date is ${DailyController.to.selectedDate}");
                                  DailyController.to.getDailyTransactions();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ],
              ));
        });
  }
}
