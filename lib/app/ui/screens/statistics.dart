import 'package:expense/app/controllers/statistics.dart';
import 'package:expense/app/ui/widget/common_loading.dart';
import 'package:expense/app/ui/widget/statistics/monthly_incomeexpensecard.dart';
import 'package:expense/app/ui/widget/statistics/piechart/pie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../json/day_month.dart';
import '../../utility/utility.dart';
import '../theme/colors.dart';
import '../widget/statistics/piechart/indicator.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder(
        init: StatisticsController(),
        initState: (_) {
          StatisticsController.to.isSelectYear = "2023";
          StatisticsController.to.isSelectMonth = "Apr";
          StatisticsController.to.getStatistics();
        },
        builder: (_) {
          return Scaffold(
              backgroundColor: AppColors.background,
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 210),
                      child: Obx(
                        () => StatisticsController.to.statisticsLoading == true
                            ? CommonNormalLoading()
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      // width: double.infinity,
                                      // height: 250,
                                      decoration: BoxDecoration(
                                          color: AppColors.black,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.grey
                                                  .withOpacity(0.01),
                                              spreadRadius: 10,
                                              blurRadius: 3,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20),
                                          PieChartSample3(),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                // Column(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.end,
                                                //   crossAxisAlignment:
                                                //       CrossAxisAlignment.start,
                                                //   children: <Widget>[
                                                //     Indicator(
                                                //       color: AppColors.red,
                                                //       text: 'Investment',
                                                //       isSquare: false,
                                                //     ),
                                                //     SizedBox(
                                                //       height: 4,
                                                //     ),
                                                //     Indicator(
                                                //       color: AppColors.primary,
                                                //       text: 'Profit',
                                                //       isSquare: false,
                                                //     ),
                                                //     SizedBox(
                                                //       height: 4,
                                                //     ),
                                                //     Indicator(
                                                //       color: AppColors.secondary,
                                                //       text: 'Withdrawal',
                                                //       isSquare: false,
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(spacing: 20, children: [
                                    IncomeExpenseCard(
                                      icon: Icons.arrow_downward_rounded,
                                      name: "INCOME",
                                      amount:
                                          "$rupee ${formatAmount(amount: StatisticsController.to.statisticsDetails.monthlyIncome)}",
                                      iconColor: AppColors.green,
                                    ),
                                    IncomeExpenseCard(
                                      icon: Icons.arrow_upward_rounded,
                                      name: "EXPENSE",
                                      iconColor: AppColors.red,
                                      amount:
                                          "$rupee ${formatAmount(amount: StatisticsController.to.statisticsDetails.monthlyExpense)}",
                                    ),
                                  ]),
                                  SizedBox(height: 20),
                                ],
                              ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(color: AppColors.black, boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 60, right: 20, left: 20, bottom: 25),
                          child: Column(
                            children: [
                              Text(
                                "STATISTICS",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                height: size.height * 0.1,
                                child: ListView.builder(
                                  itemCount: 12,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, int index) {
                                    return Obx(() => GestureDetector(
                                          onTap: () {
                                            StatisticsController.to.activeDay =
                                                index;
                                            StatisticsController
                                                    .to.isSelectMonth =
                                                yearAndMonth[index]['month'];
                                          },
                                          child: Container(
                                            width: (MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    40) /
                                                6,
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    StatisticsController
                                                            .to.isSelectYear =
                                                        yearAndMonth[index]
                                                            ['year'];
                                                    print(
                                                        "Selected Year is : ${StatisticsController.to.isSelectYear} Selected Month is : ${StatisticsController.to.isSelectMonth}");
                                                    StatisticsController.to
                                                        .getStatistics();
                                                  },
                                                  child: Text(
                                                    yearAndMonth[index]['year'],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: StatisticsController
                                                                    .to
                                                                    .isSelectYear ==
                                                                yearAndMonth[
                                                                        index]
                                                                    ['year']
                                                            ? AppColors.primary
                                                            : AppColors.white),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    StatisticsController
                                                        .to.activeDay = index;

                                                    StatisticsController
                                                            .to.isSelectMonth =
                                                        yearAndMonth[index]
                                                            ['month'];
                                                    print(
                                                        "Selected Year is : ${StatisticsController.to.isSelectYear} Selected Month is : ${StatisticsController.to.isSelectMonth}");
                                                    StatisticsController.to
                                                        .getStatistics();
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: StatisticsController
                                                                    .to
                                                                    .activeDay ==
                                                                index
                                                            ? AppColors.primary
                                                            : AppColors.white
                                                                .withOpacity(
                                                                    0.05),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        border: Border.all(
                                                            color: StatisticsController
                                                                        .to
                                                                        .activeDay ==
                                                                    index
                                                                ? AppColors
                                                                    .primary
                                                                : AppColors.white
                                                                    .withOpacity(
                                                                        0.3))),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12,
                                                              right: 12,
                                                              top: 7,
                                                              bottom: 7),
                                                      child: Text(
                                                        yearAndMonth[index]
                                                            ['month'],
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: StatisticsController
                                                                        .to
                                                                        .activeDay ==
                                                                    index
                                                                ? AppColors
                                                                    .black
                                                                : AppColors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ));
        });
  }
}
