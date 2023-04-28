import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/daily.dart';
import '../../../utility/utility.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class GrandTotalCard extends StatelessWidget {
  const GrandTotalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
    );
  }
}
