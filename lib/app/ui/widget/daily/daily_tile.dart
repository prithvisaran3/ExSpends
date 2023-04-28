import 'package:expense/app/ui/widget/common_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/daily.dart';
import '../../../utility/utility.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class DailyTile extends StatelessWidget {
  const DailyTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onLongPress: () {
        // commonDeleteDialog(context, content: "Do you want to delete?", confirmButtonPressed: (){});
      },
      child: Container(
        height: Get.height * 0.40,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              DailyController.to.dailydetails.length,
              (index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (size.width - 40) * 0.7,
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.black,
                                      AppColors.white,
                                    ],
                                  ),
                                  shape: BoxShape.circle,
                                  color: AppColors.grey.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    DailyController.to.dailydetails[index]
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
                                width: (size.width - 90) * 0.6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CommonText(
                                            text: DailyController
                                                        .to
                                                        .dailydetails[index]
                                                        .isIncome ==
                                                    "true"
                                                ? "${DailyController.to.dailydetails[index].incomeName}"
                                                : "${DailyController.to.dailydetails[index].expenseName}",
                                            fontSize: 14,
                                            fontColor: AppColors.white,
                                            fontWeight: FontWeight.w500),
                                        CommonText(
                                            text: DailyController
                                                        .to
                                                        .dailydetails[index]
                                                        .isIncome ==
                                                    "true"
                                                ? ""
                                                : " (${DailyController.to.dailydetails[index].expenseCategory})"
                                                    .toUpperCase(),
                                            fontSize: 12,
                                            fontColor: AppColors.white
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.w400),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    CommonText(
                                        text:
                                            "${getIsoToLocalTime(date: DailyController.to.dailydetails[index].createdAt.toString())}",
                                        fontSize: 12,
                                        fontColor:
                                            AppColors.white.withOpacity(0.5),
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: (size.width - 40) * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonText(
                                text:
                                    "$rupee ${DailyController.to.dailydetails[index].amount}",
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                fontColor: DailyController
                                            .to.dailydetails[index].isIncome ==
                                        "true"
                                    ? AppColors.primary
                                    : AppColors.secondary,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65, top: 8),
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
    );
  }
}
