import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/budget.dart';
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
        },
        builder: (_) {
          return Scaffold(
              backgroundColor: AppColors.grey.withOpacity(0.05),
              body: Stack(
                children: [
                  appBar(size),
                  Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                "Choose Category",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => BudgetController.to.categoryLoading == true
                ? CommonNormalLoading()
                : BudgetController.to.isCategoryEmpty == true
                    ? Text("empty")
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
                                categoryName:
                                    "${BudgetController.to.categoryDetails[index].categoryName}",
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
                Text(
                  "Date",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                CommonNormalTextFormField(
                  hintText: "Enter Expense Date",
                  controller: BudgetController.to.expenseDate,
                  validator: (data) {
                    if (data == null || data == "" || data.isEmpty) {
                      return 'Please enter date';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Expense name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xff67727d)),
                ),
                CommonNormalTextFormField(
                  hintText: "Enter Expense Name",
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
                Container(
                  width: (size.width - 140),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter Expense",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xff67727d)),
                      ),
                      CommonNormalTextFormField(
                        hintText: "Enter Expense",
                        controller: BudgetController.to.expenseAmount,
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
                ),
                Obx(() => BudgetController.to.addExpenseLoading == true
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
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.arrow_forward,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Padding incomePage(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: BudgetController.to.incomeKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Income Category",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Color(0xff67727d)),
              ),
              CommonNormalTextFormField(
                hintText: "Enter Income Category",
                controller: BudgetController.to.incomeCategory,
                validator: (data) {
                  if (data == null || data == "" || data.isEmpty) {
                    return 'Please enter category';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (size.width - 140),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter Income",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        CommonNormalTextFormField(
                          hintText: "Enter Amount",
                          controller: BudgetController.to.incomeAmount,
                          keyboardType: TextInputType.number,
                          validator: (data) {
                            if (data == null || data == "" || data.isEmpty) {
                              return 'Please enter amount';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter Date",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        CommonNormalTextFormField(
                          hintText: "Enter Income Date",
                          controller: BudgetController.to.incomeDate,
                          validator: (data) {
                            if (data == null || data == "" || data.isEmpty) {
                              return 'Please enter date';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Obx(() => BudgetController.to.addIncomeLoading == true
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
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ))
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
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CREATE BUDGET",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
