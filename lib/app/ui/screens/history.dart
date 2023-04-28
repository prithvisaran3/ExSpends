import 'package:expense/app/ui/widget/common_alert.dart';
import 'package:expense/app/ui/widget/common_loading.dart';

import 'package:expense/app/ui/widget/history/historyappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/history.dart';
import '../../utility/utility.dart';
import '../theme/colors.dart';
import '../widget/history/cards/expenseCard.dart';
import '../widget/history/cards/incomeCard.dart';

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
                  HistoryAppBar(),
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
      child: HistoryController.to.incomeDeleteLoading == true
          ? CommonNormalLoading()
          : ListView.builder(
              itemCount: HistoryController.to.getIncomeDetails.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, int index) {
                return Icard(
                  date: getIsoToLocalDate(
                      date: HistoryController.to.getIncomeDetails[index].date
                          .toString()),
                  iname:
                      HistoryController.to.getIncomeDetails[index].incomeName,
                  iamount: HistoryController.to.getIncomeDetails[index].amount,
                  onLongPress: () {
                    commonDeleteDialog(
                      context,
                      content: "      HISTORY\n Income Delete",
                      confirmButtonPressed: () {
                        HistoryController.to.deleteIncome(
                            id: "${HistoryController.to.getIncomeDetails[index].id}");
                        Get.back();
                      },
                    );
                  },
                );
              },
            ),
    );
  }

  Padding expenselist() {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: HistoryController.to.expenseDeleteLoading == true
          ? CommonNormalLoading()
          : ListView.builder(
              itemCount: HistoryController.to.getExpenseDetails.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, int index) {
                return Ecard(
                  date: getIsoToLocalDate(
                      date: HistoryController.to.getExpenseDetails[index].date
                          .toString()),
                  ename:
                      HistoryController.to.getExpenseDetails[index].expenseName,
                  eamount: HistoryController.to.getExpenseDetails[index].amount,
                  onLongPress: () {
                    commonDeleteDialog(
                      context,
                      content:  "      HISTORY\n Expense Delete",
                      confirmButtonPressed: () {
                        HistoryController.to.deleteExpense(
                            id: "${HistoryController.to.getExpenseDetails[index].id}");
                        Get.back();
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}
