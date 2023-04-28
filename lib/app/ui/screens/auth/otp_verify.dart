import 'package:expense/app/ui/screens/auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controllers/auth.dart';
import '../../../controllers/otp.dart';
import '../../theme/app_font.dart';
import '../../theme/colors.dart';
import '../../widget/common_text.dart';
import '../../widget/otp_input.dart';

class OtpVerify extends StatelessWidget {
  const OtpVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          height: Get.height,
          decoration:  BoxDecoration(
            color: AppColors.black,
          ),
          child: Column(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: media.width * 0.01),
                    child: const CommonText(
                      text: "VERIFY OTP",
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.height * 0.1,
              ),
              SizedBox(
                  height: media.height * 0.30,
                  child: SvgPicture.asset("assets/images/enter_otp.svg")),
              // SizedBox(
              //   height: media.height * 0.09,
              // ),
              SizedBox(
                height: media.height * 0.04,
              ),
              Center(
                child: CommonText(
                  text:
                      "Please type the OTP as shared on your mobile",
                  fontColor: AppColors.white.withOpacity(.4),
                ),
              ),
              SizedBox(
                height: media.width * 0.06,
              ),
              Form(
                  child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OtpInput(
                          autoFocus: true, controller: OtpController.to.first),
                      OtpInput(
                          autoFocus: false,
                          controller: OtpController.to.second),
                      OtpInput(
                          autoFocus: false, controller: OtpController.to.third),
                      OtpInput(
                          autoFocus: false,
                          controller: OtpController.to.fourth),
                      OtpInput(
                          autoFocus: false, controller: OtpController.to.fifth),
                      OtpInput(
                          autoFocus: false, controller: OtpController.to.sixth),
                    ],
                  ),
                ],
              )),

              SizedBox(
                height: media.width * 0.06,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ResetPassword());
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
                        text: "VERIFY",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: "Didn't receive?",
                    fontColor: AppColors.white.withOpacity(0.8),
                  ),
                  SizedBox(width: media.width * 0.02),
                  Obx(() => GestureDetector(
                      onTap: OtpController.to.isStartResend == true
                          ? null
                          : () {
                              OtpController.to.startTimer();
                            },
                      child: CommonText(
                        text: "Resend OTP",
                        fontColor: OtpController.to.isStartResend == true
                            ? AppColors.black.withOpacity(.3)
                            : AppColors.primary,
                      ))),
                ],
              ),
              SizedBox(
                height: media.height * 0.02,
              ),
              Obx(() => OtpController.to.isStartResend == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: CommonText(
                              text:
                                  "Otp auto resend in ${OtpController.to.seconds} secs",
                              fontColor: AppColors.white,
                            )),
                      ],
                    )
                  : const SizedBox()),


            ],
          ),
        ),
      ),
    ));
  }
}
