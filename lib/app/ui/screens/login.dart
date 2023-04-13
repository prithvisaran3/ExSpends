import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth.dart';
import '../theme/app_font.dart';
import '../theme/colors.dart';
import '../widget/common_button.dart';
import '../widget/common_loading.dart';
import '../widget/common_text.dart';
import '../widget/common_textform_field.dart';
import 'register.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                          text: "Hey,  \nLogin",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                color: AppColors.primary,
                              ),
                              text: " "
                                  "Now.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                      key: AuthController.to.loginKey,
                      child: Column(
                        children: [
                          CommonTextFormField(
                            controller: AuthController.to.lEmail,
                            prefixIcon:
                                Icon(Icons.email, color: AppColors.primary),
                            hintText: "Enter your email",
                            validator: (data) {
                              if (data == null || data == "" || data.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                          CommonTextFormField(
                            controller: AuthController.to.lPassword,
                            prefixIcon:
                                Icon(Icons.lock_open, color: AppColors.primary),
                            hintText: "Enter your password",
                            obscureText: true,
                            validator: (data) {
                              if (data == null || data == "" || data.isEmpty) {
                                return 'Please enter password';
                              } else if (data.length < 6) {
                                return 'Password minimum 6 character';
                              }
                              return null;
                            },
                          )
                        ],
                      )),
                  SizedBox(height: 15),
                  Obx(() => AuthController.to.loginLoading == true
                      ? CommonNormalLoading()
                      : CommonButton(
                          text: "Login",
                          onPressed: () {
                            if (AuthController.to.loginKey.currentState!
                                .validate()) {
                              AuthController.to.login();
                            }
                          },
                        )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "Don't have an account? ",
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(()=>Register());
                        },
                        child: CommonText(
                          text: "Sign up",
                          fontColor: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.sixteen,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
