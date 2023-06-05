import 'package:expense/app/controllers/profile.dart';

import 'package:expense/app/ui/screens/profile/settings.dart';

import 'package:expense/app/ui/widget/common_text.dart';
import 'package:expense/app/ui/widget/profile/totalcard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rive/rive.dart';
import '../../../config/app-config.dart';
import '../../theme/colors.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late StateMachineController _cloudycontroller;

  void _onInit(Artboard art) {
    var ctrl = StateMachineController.fromArtboard(art, 'Cloudy')
        as StateMachineController;
    ctrl.isActive = true;
    art.addController(ctrl);

    setState(
      () {
        _cloudycontroller = ctrl;
      },
    );
  }

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
                                        padding: EdgeInsets.only(left: 10.0),
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
                                      cloudyProfile(size),
                                      Container(
                                        height:150 ,
                                        width: (size.width - 40) * 0.6,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 25,
                                            ),
                                            CommonText(
                                                text:
                                                    "${ProfileController.to.profileDetails.name}",
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                fontColor: AppColors.white),

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

  Container cloudyProfile(Size size) {
    return Container(
      height: 150,
      width: (size.width - 40) * 0.4,
      child: Container(
          child:
              RiveAnimation.asset('assets/rive/cloudy.riv', onInit: _onInit,fit: BoxFit.cover,)),
    );
  }
}
