import 'package:flutter/material.dart';

import '../../../controllers/statistics.dart';
import '../../theme/colors.dart';
import 'piechart_widget/indicator.dart';
import 'piechart_widget/pie.dart';

class PieIndicator extends StatelessWidget {
  const PieIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
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
          pieIndicator(),
        ],
      ),
    );
  }
  Padding pieIndicator() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: StatisticsController
              .to.totalStatistics.categoryExpenseAmount.length,
          shrinkWrap: true,
          itemBuilder: (context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: index == 0
                          ? AppColors.category1
                          : index == 1
                          ? AppColors.category2
                          : index == 2
                          ? AppColors.category3
                          : index == 3
                          ? AppColors.category4
                          : index == 4
                          ? AppColors.category5
                          : index == 5
                          ? AppColors.category6
                          : index == 6
                          ? AppColors.category7
                          : index == 7
                          ? AppColors.category8
                          : AppColors.category9,
                      text: StatisticsController.to.totalStatistics
                          .categoryExpenseAmount.length <=
                          index
                          ? ""
                          : "${StatisticsController.to.totalStatistics.categoryExpenseAmount[index].expenseCategory}",
                      isSquare: false,
                    ),
                    SizedBox(
                      height: 4,
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }
}
