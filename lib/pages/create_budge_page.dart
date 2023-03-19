import 'package:budget_tracker_ui/calculations/calculations.dart';
import 'package:budget_tracker_ui/json/create_budget_json.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:budget_tracker_ui/widget/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../widget/swipebutton.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  bool isExpense = true;
  int activeCategory = 0;
  int c1index = 2;
  int c2index = 1;
  TextEditingController _budgetName =
      TextEditingController(text: "Grocery Budget");
  TextEditingController _budgetPrice = TextEditingController(text: "\$1500.00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 120),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expensebar(),
                    Incomebar(),
                  ],
                ),
                isExpense == true ? ExpensePage(size) : IncomePage(size),
              ],
            ),
          ),
        ),
        Cbudgetbar(size),
      ],
    );
  }

  Column ExpensePage(Size size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "Choose category",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(categories.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeCategory = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                      color: black,
                      border: Border.all(
                          width: 2,
                          color: activeCategory == index
                              ? primary
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
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
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: grey.withOpacity(0.15)),
                            child: Center(
                              child: Image.asset(
                                categories[index]['icon'],
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                            )),
                        Text(
                          categories[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          })),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Budget name",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Color(0xff67727d)),
              ),
              TextField(
                controller: _budgetName,
                cursorColor: black,
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: white),
                decoration: InputDecoration(
                    hintText: "Enter Budget Name", border: InputBorder.none),
              ),
              SizedBox(
                height: 20,
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
                          "Enter budget",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        TextField(
                          controller: _budgetPrice,
                          cursorColor: black,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: black),
                          decoration: InputDecoration(
                              hintText: "Enter Budget",
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.arrow_forward,
                      color: white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Padding IncomePage(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
            TextField(
              controller: _budgetName,
              cursorColor: black,
              style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: white),
              decoration: InputDecoration(
                  hintText: "Enter Budget Name", border: InputBorder.none),
            ),
            SizedBox(
              height: 20,
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
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _budgetPrice,
                        cursorColor: black,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: primary),
                        decoration: InputDecoration(
                            hintText: "Enter Income", border: InputBorder.none),
                      ),
                      CommonButton(
                          text: "Add",
                          onPressed: () {
                            var amount = addAmount(amount: _budgetPrice.text);
                            _budgetPrice.text = "";
                            print("amount is $amount");
                          })
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: size.width / 1.2,
              child: SlideAction(
                borderRadius: 12,
                elevation: 0,
                innerColor: primary,
                outerColor: primary.withOpacity(0.7),
                sliderButtonIcon: Icon(
                  Icons.lock_open,
                  size: 19,
                ),
                text: 'Swipe to Add',
                textStyle: TextStyle(
                  fontSize: 18,
                  color: black,
                ),
                onSubmit: () {},
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Column Cbudgetbar(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(
            color: black,
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
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
                              color: primary),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          AntDesign.search1,
                          color: primary,
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

  GestureDetector Incomebar() {
    return GestureDetector(
      onTap: () {
        setState(() {
          activeCategory = c2index;
          isExpense = false;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        width: 130,
        height: 40,
        decoration: BoxDecoration(
          color: black,
          border: Border.all(
              width: 2,
              color: activeCategory == c2index ? primary : Colors.transparent),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
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
              color: activeCategory == c2index ? primary : white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Padding Expensebar() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            activeCategory = c1index;
            isExpense = true;
          });
        },
        child: Container(
          margin: EdgeInsets.only(
            left: 30,
          ),
          width: 130,
          height: 40,
          decoration: BoxDecoration(
            color: black,
            border: Border.all(
                width: 2,
                color:
                    activeCategory == c1index ? primary : Colors.transparent),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
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
                color: activeCategory == c1index ? primary : white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
