import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/budget.dart';
import '../../theme/colors.dart';

class ExpenseCategoryCard extends StatelessWidget {
  ExpenseCategoryCard(
      {Key? key,
      required this.index,
      required this.categoryName,
      required this.onPressed})
      : super(key: key);
  final int index;
  final String categoryName;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Container(
                    //   width: 40,
                    //   height: 40,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: AppColors.grey.withOpacity(0.15)),
                    //   child: Center(
                    //     child: Image.asset(
                    //       categories[0]['icon'],
                    //       width: 30,
                    //       height: 30,
                    //       fit: BoxFit.contain,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      categoryName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
