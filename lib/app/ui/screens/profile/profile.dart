import 'package:expense/app/controllers/profile.dart';

import 'package:expense/app/ui/screens/profile/settings.dart';

import 'package:expense/app/ui/widget/common_text.dart';
import 'package:expense/app/ui/widget/profile/totalcard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../config/app-config.dart';
import '../../theme/colors.dart';

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
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 450, left: 20, right: 20),
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
                                          fontSize: 18,
                                          fontColor: AppColors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text: "Phone Number",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          fontColor: AppColors.white),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text: "Email",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          fontColor: AppColors.white),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          text:
                                              "${ProfileController.to.profileDetails.name}",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          fontColor: Color(0xff67727d)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text:
                                              "${ProfileController.to.profileDetails.phone}",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          fontColor: Color(0xff67727d)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      CommonText(
                                          text:
                                              "${ProfileController.to.profileDetails.email}",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
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
                                  top: 60, right: 20, left: 20, bottom: 25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left: 10.0),
                                        child: CommonText(
                                          text: "Profile",
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          fontColor: AppColors.primary,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => Settings());
                                        },
                                        child: Icon(
                                          Ionicons.settings,
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
                                                  // width: 85,
                                                  // height: 85,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              "${AppConfig.noImage}"),
                                                          fit: BoxFit.fill)),
                                                ),
                                              ),
                                              RotatedBox(
                                                quarterTurns: -2,
                                                child: CircularPercentIndicator(
                                                    animation: true,
                                                    animationDuration: 2000,
                                                    circularStrokeCap:
                                                        CircularStrokeCap.round,
                                                    backgroundColor: AppColors
                                                        .grey
                                                        .withOpacity(0.3),
                                                    radius: 60.0,
                                                    lineWidth: 6.0,
                                                    percent: 0.8,
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
