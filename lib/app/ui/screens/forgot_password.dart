import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/auth.dart';
import '../theme/app_font.dart';
import '../theme/colors.dart';
import '../widget/common_loading.dart';
import '../widget/common_text.dart';
import '../widget/common_textform_field.dart';
import 'otp_verify.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool isVerify = false;
    return Scaffold(
        body: SafeArea(
            maintainBottomViewPadding: true,
            child: Container(
              height: Get.height,
              decoration: const BoxDecoration(
                color: AppColors.black,
              ),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: media.width * 0.01),
                              child: const CommonText(
                                text: "Forgot Password",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontColor: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: media.height * 0.04,
                        ),
                        Center(
                            child: SvgPicture.asset(
                          "assets/images/forgot_password.svg",
                          height: Get.height * 0.47,
                        )),
                        // SizedBox(
                        //   height: media.height * 0.09,
                        // ),

                        Form(
                          key: AuthController.to.validateEmailKey,
                          child: Column(
                            children: [
                              CommonTextFormField(
                                hintText: "Enter your phone number",
                                controller: AuthController.to.vphone,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: AppColors.primary,
                                ),
                                validator: (data) {
                                  if (data!.isEmpty || data == "") {
                                    return "Phone field required";
                                  } else if (data.length < 10) {
                                    return "Enter valid phone number";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.06,
                        ),
                        GestureDetector(
                          onTap: () {
                            // if (AuthController.to.validateEmailKey.currentState!
                            //     .validate()) {
                            //   AuthController.to.validateEmailForForgotPassword();
                            // }
                            Get.to(() => const OtpVerify());
                          },
                          child: Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.primary,
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.white.withOpacity(.4),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: const Offset(0.4, 0.6)),
                                ],

                              ),
                              child: const Center(
                                child: CommonText(
                                  text: "SEND OTP",
                                  fontColor: AppColors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                      ],
                    ),
                    Obx(() => AuthController.to.phoneValidateLoading == true
                        ? Container(
                            height: media.height,
                            width: media.width,
                            color: AppColors.black.withOpacity(.6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CommonNormalLoading(),
                                SizedBox(
                                  height: media.height * 0.02,
                                ),
                                const CommonText(
                                  text: "Please wait...",
                                  fontColor: AppColors.white,
                                )
                              ],
                            ))
                        : const SizedBox())
                  ],
                ),
              ),
            )));
  }
}
