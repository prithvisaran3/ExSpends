import 'package:budget_tracker_ui/json/daily_json.dart';
import 'package:budget_tracker_ui/json/day_month.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 3;
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
                child: Column(
                  children: List.generate(
                    daily.length,
                    (index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (size.width - 40) * 0.7,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            black,
                                            white,
                                          ],
                                        ),
                                        shape: BoxShape.circle,
                                        color: grey.withOpacity(0.1),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          daily[index]['icon'],
                                          width: 30,
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      width: (size.width - 90) * 0.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            daily[index]['name'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: white,
                                                fontWeight: FontWeight.w500),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            daily[index]['date'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: white.withOpacity(0.5),
                                                fontWeight: FontWeight.w400),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: (size.width - 40) * 0.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      daily[index]['price'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 65, top: 8),
                            child: Divider(
                              thickness: 0.8,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 16,
                            color: white.withOpacity(0.4),
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "\u20B91780.00",
                        style: TextStyle(
                            fontSize: 20,
                            color: white,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(color: black
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: grey.withOpacity(0.01),
                  //     spreadRadius: 10,
                  //     blurRadius: 3,
                  //     // changes position of shadow
                  //   ),
                  // ]
                  ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, right: 20, left: 20, bottom: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Transaction",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primary),
                        ),
                        Icon(
                          AntDesign.search1,
                          color: primary,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DatePicker(
                      DateTime.now(),
                      width: 60,
                      height: 76,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      deactivatedColor: Colors.white,
                      selectionColor: primary,
                      selectedTextColor: black,

                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
          ],
        ),
      ],
    );
  }
}
