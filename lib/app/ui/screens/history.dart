import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/history.dart';
import '../../utility/utility.dart';
import '../theme/colors.dart';
import '../widget/history/expenseCard.dart';
import '../widget/history/incomeCard.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HistoryController(),
        initState: (_) {
          HistoryController.to.isExpense = true;
          HistoryController.to.activeCategory = HistoryController.to.h1index;

          HistoryController.to.getIncome();
          HistoryController.to.getExpense();
        },
        builder: (_) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Obx(
              () => Stack(
                children: [
                  Container(
                    height: 180,
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
                      padding: const EdgeInsets.only(top: 60, bottom: 25),
                      child: Column(
                        children: [
                          Text(
                            "HISTORY",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expensebar(),
                                    Incomebar(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  HistoryController.to.isExpense == true
                      ? expenselist()
                      : incomelist(),
                ],
              ),
            ),
          );
        });
  }

  Padding incomelist() {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: ListView.builder(
        itemCount: HistoryController.to.getIncomeDetails.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, int index) {
          return Icard(
              date: getIsoToLocalDate(
                  date: HistoryController.to.getIncomeDetails[index].date
                      .toString()),
              iname: HistoryController.to.getIncomeDetails[index].incomeName,
              iamount: HistoryController.to.getIncomeDetails[index].amount);
        },
      ),
    );
  }

  Padding expenselist() {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: ListView.builder(
        itemCount: HistoryController.to.getExpenseDetails.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, int index) {
          return Ecard(
              date: getIsoToLocalDate(
                  date: HistoryController.to.getExpenseDetails[index].date
                      .toString()),
              ename: HistoryController.to.getExpenseDetails[index].expenseName,
              eamount: HistoryController.to.getExpenseDetails[index].amount);
        },
      ),
    );
  }

  GestureDetector Incomebar() {
    return GestureDetector(
      onTap: () async {
        HistoryController.to.activeCategory = HistoryController.to.h2index;
        HistoryController.to.isExpense = false;
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        width: 130,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border.all(
              width: 2,
              color: HistoryController.to.activeCategory ==
                      HistoryController.to.h2index
                  ? AppColors.primary
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Income",
            style: TextStyle(
              color: HistoryController.to.activeCategory ==
                      HistoryController.to.h2index
                  ? AppColors.primary
                  : AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector Expensebar() {
    return GestureDetector(
      onTap: () async {
        HistoryController.to.activeCategory = HistoryController.to.h1index;
        HistoryController.to.isExpense = true;
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: GestureDetector(
          onTap: () {
            HistoryController.to.activeCategory = HistoryController.to.h1index;
            HistoryController.to.isExpense = true;
          },
          child: Container(
            margin: EdgeInsets.only(
              left: 30,
            ),
            width: 130,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.black,
              border: Border.all(
                  width: 2,
                  color: HistoryController.to.activeCategory ==
                          HistoryController.to.h1index
                      ? AppColors.primary
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Expense",
                style: TextStyle(
                  color: HistoryController.to.activeCategory ==
                          HistoryController.to.h1index
                      ? AppColors.primary
                      : AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
