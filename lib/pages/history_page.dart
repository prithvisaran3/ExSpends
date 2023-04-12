import 'dart:convert';

import 'package:budget_tracker_ui/functions/function.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:budget_tracker_ui/widget/common_button.dart';
import 'package:budget_tracker_ui/widget/history/expenseCard.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import '../widget/history/incomeCard.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isExpense = true;
  int activeCategory = 3;
  int h1index = 2;
  int h2index = 1;
  dynamic edata;
  dynamic idata;
  dynamic isLoading = false;

  @override
  // getexpense() async {
  //   dynamic result;
  //   var url = "${AppConfig.baseUrl}api/expense/get";
  //   setState(() {
  //     isLoading=true;
  //   });
  //
  //   try {
  //     var response = await helper.get(url: url, auth: true);
  //     var res = jsonDecode(response);
  //
  //     if (res['status'] == 200) {
  //       setState(() {
  //         isLoading=false;
  //       });
  //       result = res['data'];
  //
  //       print("Expense response : $result");
  //     } else if (res['status'] == 500) {
  //       result = null;
  //       setState(() {
  //         isLoading=false;
  //       });
  //       // print("${res.body}");
  //     } else if (res['status'] == 422) {
  //       result = null;
  //       setState(() {
  //         isLoading=false;
  //       });
  //       // print("${res.body}");
  //     }
  //   } catch (e) {
  //     result = null;
  //     print("error");
  //     setState(() {
  //       isLoading=false;
  //     });
  //   }
  //   return result;
  // }

  // void initState() {
  //   getexpense();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(color: black, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
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
                      color: primary,
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
          isExpense == true ? expenselist() : incomelist(),
        ],
      ),
    );
  }

  Padding incomelist() {
    return Padding(
      padding: const EdgeInsets.only(top: 170.0),
      child: ListView.builder(
        itemCount: idata['data'].length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, int index) {
          return Icard(
              date: idata['data'][index]['date'],
              iname: idata['data'][index]['income_name'],
              iamount: idata['data'][index]['amount']);
        },
      ),
    );
  }

  Padding expenselist() {
    return (isLoading == true)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("....."),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 170.0),
            child: ListView.builder(
              itemCount: edata['data'].length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, int index) {
                return Ecard(
                    date: edata['data'][index]['date'],
                    ename: edata['data'][index]['expense_name'],
                    eamount: edata['data'][index]['amount']);
              },
            ),
          );
  }

  GestureDetector Incomebar() {
    return GestureDetector(
      onTap: () async {
        setState(() {
          activeCategory = h2index;
          isExpense = false;
        });
        idata = await getincome();
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
              color: activeCategory == h2index ? primary : Colors.transparent),
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
              color: activeCategory == h2index ? primary : white,
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
        setState(() {
          activeCategory = h1index;
          isExpense = true;
          isLoading = true;
        });

        edata = await getexpense();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              activeCategory = h1index;
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
                      activeCategory == h1index ? primary : Colors.transparent),
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
                  color: activeCategory == h1index ? primary : white,
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
