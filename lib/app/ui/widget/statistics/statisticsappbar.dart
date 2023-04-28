import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/statistics.dart';
import '../../../json/day_month.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class StatisticsAppBar extends StatelessWidget {
  const StatisticsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return  Container(
      height: Get.height * 0.27,
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
            top: 55, right: 20, left: 20, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CommonText(
                text: "Statistics",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontColor: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: size.height * 0.10,
              child: ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) {
                  return Obx(
                        () => GestureDetector(
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
                              child: CommonText(
                                  text: yearAndMonth[index]
                                  ['year'],
                                  fontSize: 15,
                                  fontColor: StatisticsController
                                      .to
                                      .isSelectYear ==
                                      yearAndMonth[index]
                                      ['year']
                                      ? AppColors.primary
                                      : AppColors.white),
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
                                    BorderRadius.circular(
                                        5),
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
                                  child: CommonText(
                                      text: yearAndMonth[
                                      index]['month'],
                                      fontSize: 10,
                                      fontWeight:
                                      FontWeight.w600,
                                      fontColor:
                                      StatisticsController
                                          .to
                                          .activeDay ==
                                          index
                                          ? AppColors
                                          .black
                                          : AppColors
                                          .white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
