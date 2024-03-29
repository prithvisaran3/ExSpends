
import 'package:expense/app/ui/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/budget.dart';
import '../../theme/colors.dart';

class ExpenseCategoryCard extends StatelessWidget {
  ExpenseCategoryCard(
      {Key? key,
      required this.index,
      required this.categoryName,
      required this.onPressed,
      required this.image})
      : super(key: key);
  final int index;
  final String categoryName;
  final String image;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Container(
              width: 150,
              height: 170,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  border: Border.all(
                      width: 2,
                      color: BudgetController.to.categoryIndex == index
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
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.grey.withOpacity(0.15)),
                      child: Center(
                        child: Image.asset(
                          image,
                          // width: 30,
                          // height: 30,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    CommonText(
                      text: categoryName,
                      fontWeight: FontWeight.bold,
                      fontSize: categoryName.length>9?13:18,
                      fontColor: AppColors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
