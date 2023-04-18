import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/profile.dart';
import '../../../utility/utility.dart';
import '../../theme/colors.dart';
import '../common_text.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.primary,

            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
          child: Row(
            children: [
              Spacer(),
              Column(
                children: [
                  CommonText(text: "TOTAL INCOME", fontWeight: FontWeight.bold),
                  CommonText(
                      text:
                          "$rupee ${formatAmount(amount: ProfileController.to.totalDetails.totalIncome)}",
                      fontWeight: FontWeight.bold),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  CommonText(
                      text: "TOTAL EXPENSE", fontWeight: FontWeight.bold),
                  CommonText(
                      text:
                          "$rupee ${formatAmount(amount: ProfileController.to.totalDetails.totalExpense)}",
                      fontWeight: FontWeight.bold),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
