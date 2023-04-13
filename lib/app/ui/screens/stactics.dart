import 'package:expense/app/controllers/statistics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../json/day_month.dart';
import '../theme/colors.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": AppColors.blue,
        "year": "Income",
        "cost": "\u20B96593.75"
      },
      {
        "icon": Icons.arrow_forward,
        "color": AppColors.red,
        "year": "Expense",
        "cost": "\u20B92645.50"
      }
    ];
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 210),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Net balance",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Color(0xff67727d)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\u20B92446.90",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: AppColors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: (size.width - 20),
                                  height: 150,
                                  // child: LineChart(
                                  //   mainData(),
                                  // ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Wrap(
                      spacing: 20,
                      children: List.generate(
                        expenses.length,
                        (index) {
                          return Container(
                            width: (size.width - 60) / 2,
                            height: 170,
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.01),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 20, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: expenses[index]['color']),
                                    child: Center(
                                        child: Icon(
                                      expenses[index]['icon'],
                                      color: AppColors.white,
                                    )),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        expenses[index]['year'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xff67727d)),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        expenses[index]['cost'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: AppColors.black, boxShadow: [
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
                          height: 50,
                          child: ListView.builder(
                            itemCount: 12,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, int index) {
                              return Obx(() => GestureDetector(
                                    onTap: () {
                                      StatisticsController.to.activeDay = index;
                                      StatisticsController.to.isSelectMonth =
                                          yearAndMonth[index]['month'];
                                    },
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  40) /
                                              6,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              StatisticsController
                                                      .to.isSelectYear =
                                                  yearAndMonth[index]['year'];
                                              print(
                                                  "Selected Year is : ${StatisticsController.to.isSelectYear} Selected Month is : ${StatisticsController.to.isSelectMonth}");
                                            },
                                            child: Text(
                                              yearAndMonth[index]['year'],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: StatisticsController.to
                                                              .isSelectYear ==
                                                          yearAndMonth[index]
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
                                                  yearAndMonth[index]['month'];
                                              print(
                                                  "Selected Year is : ${StatisticsController.to.isSelectYear} Selected Month is : ${StatisticsController.to.isSelectMonth}");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: StatisticsController
                                                              .to.activeDay ==
                                                          index
                                                      ? AppColors.primary
                                                      : AppColors.white.withOpacity(0.05),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: StatisticsController
                                                                  .to
                                                                  .activeDay ==
                                                              index
                                                          ? AppColors.primary
                                                          : AppColors.white.withOpacity(
                                                              0.3))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12,
                                                    right: 12,
                                                    top: 7,
                                                    bottom: 7),
                                                child: Text(
                                                  yearAndMonth[index]['month'],
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: StatisticsController
                                                                  .to
                                                                  .activeDay ==
                                                              index
                                                          ? AppColors.black
                                                          : AppColors.white),
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
  }
}
