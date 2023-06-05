import 'package:expense/app/controllers/settings.dart';
import 'package:expense/app/ui/theme/colors.dart';
import 'package:expense/app/ui/widget/common_text.dart';
import 'package:expense/app/ui/widget/profile/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../controllers/profile.dart';
import '../../../utility/utility.dart';
import '../../widget/common_alert.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColors.primary,
                  ),
                ),
                Container(
                  child: Center(
                      child: Image.asset(
                    "assets/logo/L2.png",
                    height: 200,
                  )),
                ),
                // CommonText(
                //   text: "In-app Features",
                //   fontColor: Colors.white,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 18,
                // ),
                // SizedBox(height: 10),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(12),
                //     boxShadow: [
                //       BoxShadow(
                //         color: AppColors.white.withOpacity(0.3),
                //         spreadRadius: 2,
                //         blurRadius: 3,
                //       ),
                //     ],
                //   ),
                //   child: Column(
                //     children: [
                //       SettingsMenuCard(
                //           icon: Icons.currency_rupee_rounded,
                //           name: "Currency Change",
                //           onPressed: () {
                //             successAlert(context, content: "Coming soon...",
                //                 confirmButtonPressed: () {
                //               Get.back();
                //             });
                //           }),
                //     ],
                //   ),
                // ),

                CommonText(
                  text: "Feedback",
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SettingsMenuCard(
                            icon: Icons.bug_report,
                            name: "Report a Bug",
                            onPressed: () {
                              bugReport(context, content: "",
                                  confirmButtonPressed: () {
                                if (SettingsController.to.bugKey.currentState!
                                    .validate()) {
                                  SettingsController.to.sendBug();
                                  // Get.back();
                                }
                              });
                            }),
                        SettingsMenuCard(
                            icon: Icons.thumb_up_sharp,
                            name: "Send Feedback",
                            onPressed: () {
                              successAlert(context, content: "Coming soon...",
                                  confirmButtonPressed: () {
                                Get.back();
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CommonText(
                  text: "General",
                  fontColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SettingsMenuCard(
                          icon: Icons.person,
                          name: "Privacy Policy",
                          onPressed: () {
                            openBrowser(
                                url:
                                    "https://limitless360.org/index.php/privacy-policy/");
                          }),
                      SettingsMenuCard(
                          icon: Icons.info_outline,
                          name: "Terms and Conditions",
                          onPressed: () {
                            openBrowser(
                                url:
                                    "https://limitless360.org/index.php/terms-and-service/");
                          }),
                      SettingsMenuCard(
                          icon: Icons.logout,
                          name: "Logout",
                          onPressed: () {
                            commonAlertDialog(context, content: "Logout?",
                                confirmButtonPressed: () {
                              ProfileController.to.logout();
                              Get.back();
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
