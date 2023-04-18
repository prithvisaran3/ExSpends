import 'package:expense/app/controllers/profile.dart';
import 'package:expense/app/ui/screens/profile/settings.dart';
import 'package:expense/app/ui/widget/common_alert.dart';
import 'package:expense/app/ui/widget/common_snackbar.dart';
import 'package:expense/app/ui/widget/common_text.dart';
import 'package:expense/app/ui/widget/profile/totalcard.dart';
import 'package:expense/app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../theme/colors.dart';
import '../../widget/common_button.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder(
        init: ProfileController(),
        initState: (_) {
          ProfileController.to.getProfile();
          ProfileController.to.getTotal();
        },
        builder: (_) {
          return Scaffold(
              backgroundColor: AppColors.background,
              body: Container(
                height: size.height,
                child: Obx(
                  () => Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 380, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          text: "Name",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontColor: AppColors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text: "Phone Number",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontColor: AppColors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text: "Email",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontColor: AppColors.white),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CommonText(
                                          text:
                                              "${ProfileController.to.profileDetails.name}",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontColor: Color(0xff67727d)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text:
                                              "${ProfileController.to.profileDetails.phone}",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontColor: Color(0xff67727d)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text:
                                              "${ProfileController.to.profileDetails.email}",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontColor: Color(0xff67727d)),
                                    ],
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
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(0.02),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, right: 20, left: 20, bottom: 25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonText(
                                        text: "Profile",
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontColor: AppColors.primary,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => Settings());
                                        },
                                        child: Icon(
                                          Icons.settings,
                                          color: AppColors.primary,
                                        ),
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
                                              Positioned(
                                                top: 8,
                                                left: 8,
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
                                              ),
                                              RotatedBox(
                                                quarterTurns: -2,
                                                child: CircularPercentIndicator(
                                                    circularStrokeCap:
                                                        CircularStrokeCap.round,
                                                    backgroundColor: AppColors
                                                        .grey
                                                        .withOpacity(0.3),
                                                    radius: 50.0,
                                                    lineWidth: 6.0,
                                                    percent: 0.53,
                                                    progressColor:
                                                        AppColors.primary),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: (size.width - 40) * 0.6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text:
                                                    "${ProfileController.to.profileDetails.name}",
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                fontColor: AppColors.white),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TotalCard(),
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
              ));
        });
  }
}
