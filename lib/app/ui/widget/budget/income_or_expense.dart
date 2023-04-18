import 'package:expense/app/ui/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/budget.dart';
import '../../theme/colors.dart';

class IncomeExpenseCard extends StatelessWidget {
  const IncomeExpenseCard(
      {Key? key,
      required this.index,
      required this.cardName,
      required this.onPressed})
      : super(key: key);
  final int index;
  final String cardName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: Obx(() => GestureDetector(
            onTap: onPressed,
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
                    color: BudgetController.to.selectedIndex == index
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
                child: CommonText(
                  text: cardName,
                  fontColor: BudgetController.to.selectedIndex == index
                      ? AppColors.primary
                      : AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          )),
    );
  }
}
