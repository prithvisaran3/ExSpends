import 'package:expense/app/ui/widget/common_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../controllers/budget.dart';
import '../../utility/utility.dart';
import '../theme/colors.dart';
import '../widget/budget/expense_category.dart';
import '../widget/budget/income_or_expense.dart';
import '../widget/common_loading.dart';
import '../widget/normal_textform_field.dart';

class AddBudget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder(
        init: BudgetController(),
        initState: (_) {
          BudgetController.to.getCategories();
          BudgetController.to.incomeDate.text =
              SendIsoToLocalDate(date: DateTime.now().toString());

          BudgetController.to.expenseDate.text =
              SendIsoToLocalDate(date: DateTime.now().toString());
        },
        builder: (_) {
          return Scaffold(
              backgroundColor: AppColors.grey.withOpacity(0.05),
              body: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 60),
                          Row(
                            children: [
                              IncomeExpenseCard(
                                index: 0,
                                cardName: "Expense",
                                onPressed: () {
                                  BudgetController.to.selectedIndex = 0;
                                },
                              ),
                              IncomeExpenseCard(
                                index: 1,
                                cardName: "Income",
                                onPressed: () {
                                  BudgetController.to.selectedIndex = 1;
                                },
                              ),
                            ],
                          ),
                          Obx(() => BudgetController.to.selectedIndex == 0
                              ? expensePage(size)
                              : incomePage(size))
                        ],
                      ),
                    ),
                  ),
                  appBar(size),
                ],
              ));
        });
  }

  Column expensePage(Size size) {
    return Column(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
              child: CommonText(
                text: "Choose Category",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontColor: AppColors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => BudgetController.to.categoryLoading == true
                ? CommonNormalLoading()
                : BudgetController.to.isCategoryEmpty == true
                    ? CommonText(text: "empty")
                    : Container(
                        height: 150,
                        child: ListView.builder(
                            itemCount:
                                BudgetController.to.categoryDetails.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, int index) {
                              return ExpenseCategoryCard(
                                index: index,
                                image:
                                    "assets/images/${BudgetController.to.categoryDetails[index].categoryName}.png",
                                categoryName:
                                    "${BudgetController.to.categoryDetails[index].categoryName}",
                                // image:  "${AppConfig.baseUrl}/${BudgetController.to.categoryDetails[index].image}",
                                onPressed: () {
                                  BudgetController.to.categoryIndex = index;
                                  BudgetController.to.selectedCategory =
                                      "${BudgetController.to.categoryDetails[index].categoryName}";
                                  print(
                                      "Selected category is ${BudgetController.to.selectedCategory}");
                                },
                              );
                            }),
                      )),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: BudgetController.to.expenseKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CommonText(
                      text: "DATE",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontColor: AppColors.white.withOpacity(0.7)),
                ),
                SizedBox(height: 10),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  height: 40,
                  width: Get.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0.2, 0.6)),
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black,
                  ),
                  child: TextFormField(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: Get.context!,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015, 01, 01),
                        lastDate: DateTime(2029),
                      );
                      BudgetController.to.expenseDate.text =
                          SendIsoToLocalDate(date: pickedDate.toString());
                    },
                    textAlign: TextAlign.center,
                    controller: BudgetController.to.expenseDate,
                    validator: (data) {
                      if (data == null || data == "" || data.isEmpty) {
                        return 'Please enter date';
                      }
                      return null;
                    },
                    cursorColor: AppColors.black,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.white.withOpacity(0.4),
                    ),
                    decoration: InputDecoration(
                        hintText:
                            "${SendIsoToLocalDate(date: DateTime.now().toString())}",
                        hintStyle: TextStyle(
                          color: AppColors.white.withOpacity(0.4),
                          fontWeight: FontWeight.w700,
                        ),
                        border: InputBorder.none),
                  ),
                ),
                // CommonNormalTextFormField(
                //   hintText: "${SendIsoToLocalDate(date: DateTime.now().toString(),)}",
                //   controller: BudgetController.to.expenseDate,
                //   validator: (data) {
                //     if (data == null || data == "" || data.isEmpty) {
                //       return 'Please enter date';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CommonText(
                      text: "EXPENSE NAME",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontColor: AppColors.white.withOpacity(0.7)),
                ),
                SizedBox(
                  height: 10,
                ),
                CommonNormalTextFormField(
                  hintText: "Enter expense name",
                  controller: BudgetController.to.expenseName,
                  validator: (data) {
                    if (data == null || data == "" || data.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CommonText(
                      text: "AMOUNT",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontColor: AppColors.white.withOpacity(0.7)),
                ),
                SizedBox(
                  height: 10,
                ),
                CommonNormalTextFormField(
                  hintText: "Enter amount",
                  controller: BudgetController.to.expenseAmount,
                  keyboardType: TextInputType.number,
                  validator: (data) {
                    if (data == null || data == "" || data.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                Obx(
                  () => BudgetController.to.addExpenseLoading == true
                      ? CommonNormalLoading()
                      : Center(
                          child: GestureDetector(
                            onTap: () {
                              if (BudgetController.to.expenseKey.currentState!
                                  .validate()) {
                                BudgetController.to.addExpense();
                              }
                            },
                            child: Container(
                              width: 210,
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primary,
                                    spreadRadius: 1.3,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Shimmer.fromColors(
                                baseColor: AppColors.black,
                                highlightColor: AppColors.white,
                                child: CommonText(
                                  text: "PRESS TO CONFIRM",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding incomePage(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: BudgetController.to.incomeKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.10),
              Center(
                child: CommonText(
                    text: "DATE",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    fontColor: AppColors.white.withOpacity(0.7)),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                height: 40,
                width: Get.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0.2, 0.6)),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                child: TextFormField(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: Get.context!,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 01, 01),
                      lastDate: DateTime(2029),
                    );
                    BudgetController.to.incomeDate.text =
                        SendIsoToLocalDate(date: pickedDate.toString());
                  },
                  textAlign: TextAlign.center,
                  controller: BudgetController.to.incomeDate,
                  validator: (data) {
                    if (data == null || data == "" || data.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                  cursorColor: AppColors.black,
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.white.withOpacity(0.7),
                  ),
                  decoration: InputDecoration(
                      hintText:
                          "${SendIsoToLocalDate(date: DateTime.now().toString())}",
                      hintStyle: TextStyle(
                        color: AppColors.white.withOpacity(0.4),
                        fontWeight: FontWeight.w700,
                      ),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: CommonText(
                  text: "INCOME NAME",
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontColor: AppColors.white.withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CommonNormalTextFormField(
                hintText: "Enter Income name",
                controller: BudgetController.to.incomeCategory,
                validator: (data) {
                  if (data == null || data == "" || data.isEmpty) {
                    return 'Please enter income name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CommonText(
                      text: "AMOUNT",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontColor: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CommonNormalTextFormField(
                    hintText: "Enter amount",
                    controller: BudgetController.to.incomeAmount,
                    keyboardType: TextInputType.number,
                    validator: (data) {
                      if (data == null || data == "" || data.isEmpty) {
                        return 'Please enter amount';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.10),
              Obx(
                () => BudgetController.to.addIncomeLoading == true
                    ? CommonNormalLoading()
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            if (BudgetController.to.incomeKey.currentState!
                                .validate()) {
                              BudgetController.to.addIncome();
                            }
                          },
                          child: Container(
                            width: 210,
                            padding: EdgeInsets.all(10),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary,
                                  spreadRadius: 1.3,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: Shimmer.fromColors(
                              baseColor: AppColors.black,
                              highlightColor: AppColors.white,
                              child: CommonText(
                                text: "PRESS TO CONFIRM",
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Column appBar(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.16,
          width: size.width,
          decoration: BoxDecoration(
            color: AppColors.black,
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, right: 20, left: 20, bottom: 25),
            child: Column(
              children: [
                CommonText(
                    text: "Create Budget",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontColor: AppColors.primary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
