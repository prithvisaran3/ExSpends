import 'package:budget_tracker_ui/functions/function.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../widget/common_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  dynamic data;
  dynamic isLoading=false;

  check() async {
    data = await getprofile();
    print("Data is ${data['data']['email']}");
  }

  @override
  Widget build(BuildContext context) {
    check();

    return Scaffold(
      backgroundColor: background,
      body: getBody(),
    );
  }

  @override
  void initState() {
    data = getprofile();

    super.initState();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 380, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        Text(
                          "${data['data']['name']}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        Text(
                          "${data['data']['phone']}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        Text(
                          "${data['data']['email']}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d)),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:20.0,left: 200),
                          child: CommonButton(
                            text: "Logout",
                            onPressed: () {
                              logout(context: context);

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: black, boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.02),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 45, right: 20, left: 20, bottom: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: primary,
                              ),
                            ),
                            Icon(
                              AntDesign.setting,
                              color: primary,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Container(
                              width: (size.width - 40) * 0.4,
                              child: Container(
                                child: Stack(
                                  children: [
                                    RotatedBox(
                                      quarterTurns: -2,
                                      child: CircularPercentIndicator(
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          backgroundColor:
                                              grey.withOpacity(0.3),
                                          radius: 110.0,
                                          lineWidth: 6.0,
                                          percent: 0.53,
                                          progressColor: primary),
                                    ),
                                    Positioned(
                                      top: 14,
                                      left: 13,
                                      child: Container(
                                        width: 85,
                                        height: 85,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: (size.width - 40) * 0.6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Prithvi Saran",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Credit score: 73.50",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: white.withOpacity(0.4)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: primary,
                              gradient: LinearGradient(
                                colors: [
                                  primary,
                                  secondary,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: primary.withOpacity(0.01),
                                  spreadRadius: 10,
                                  blurRadius: 3,
                                  // changes position of shadow
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 25, bottom: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Canara Bank",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: black),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\u20B92446.90",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: black),
                                    ),
                                  ],
                                ),

                                // Container(
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(10),
                                //       border: Border.all(color: black)),
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(13.0),
                                //     child: Text(
                                //       "Update",
                                //       style: TextStyle(color: black),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
