import 'package:expense/app/controllers/statistics.dart';
import 'package:expense/app/ui/widget/common_loading.dart';

import 'package:expense/app/ui/widget/statistics/monthly_incomeexpensecard.dart';

import 'package:expense/app/ui/widget/statistics/statisticsappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/utility.dart';
import '../theme/colors.dart';
import '../widget/statistics/pie_container.dart';

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
                  padding: const EdgeInsets.only(top: 250),
                  child: Obx(
                    () => StatisticsController.to.statisticsLoading == true
                        ? CommonNormalLoading()
                        : Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: PieIndicator(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Wrap(spacing: 20, children: [
                                IncomeExpenseCard(
                                  icon: Icons.arrow_downward_rounded,
                                  name: "INCOME",
                                  amount: StatisticsController
                                              .to
                                              .statisticsDetails
                                              .monthlyIncome !=
                                          null
                                      ? "$rupee ${StatisticsController.to.statisticsDetails.monthlyIncome}"
                                      : "$rupee 0",
                                  iconColor: AppColors.green,
                                ),
                                IncomeExpenseCard(
                                  icon: Icons.arrow_upward_rounded,
                                  name: "EXPENSE",
                                  iconColor: AppColors.red,
                                  amount: StatisticsController
                                              .to
                                              .statisticsDetails
                                              .monthlyExpense !=
                                          null
                                      ? "$rupee ${StatisticsController.to.statisticsDetails.monthlyExpense}"
                                      : "$rupee 0",
                                ),
                              ]),
                              SizedBox(height: 20),
                            ],
                          ),
                  ),
                ),
              ),
              StatisticsAppBar(),
            ],
          ),
        );
      },
    );
  }
}
