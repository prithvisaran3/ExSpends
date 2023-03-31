import 'dart:math';
import 'dart:ui';

import 'package:budget_tracker_ui/functions/function.dart';
import 'package:budget_tracker_ui/pages/root_app.dart';
import 'package:budget_tracker_ui/pages/signup_page.dart';
import 'package:flutter/material.dart';

import '../theme/app_font.dart';
import '../theme/colors.dart';
import '../widget/common_button.dart';
import '../widget/common_text.dart';
import '../widget/common_textform_field.dart';
// import 'package:slide_to_act/slide_to_act.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final loginkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
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
                            color: white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                          text: "Hey,  \nLogin",
                          children: [
                            TextSpan(
                              style: TextStyle(
                                color: primary,
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
                      key: loginkey,
                      child: Column(
                        children: [
                          enterEmail(),
                          enterPassword(),
                        ],
                      )),
                  SizedBox(height: 15),
                  loginButton(context),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "Don't have an account? ",
                        fontColor: white,
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return esignup();
                          }));
                        },
                        child: CommonText(
                          text: "Sign up",
                          fontColor: primary,
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

  CommonButton loginButton(BuildContext context) {
    return CommonButton(
      text: "Login",
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return RootApp();
        //
        if (loginkey.currentState!.validate()) {
          login(context: context,email: "prithvi@gmail.com", password: "prithvi3");
        }
      },
    );
  }

  CommonTextFormField enterPassword() {
    return CommonTextFormField(
      controller: password,
      prefixIcon: Icon(Icons.lock_open, color: primary),
      hintText: "Enter your password",
      obscureText: true,
    );
  }

  CommonTextFormField enterEmail() {
    return CommonTextFormField(
      controller: email,
      prefixIcon: Icon(Icons.email, color: primary),
      hintText: "Enter your email",
      // controller: AuthController.to.lEmail,
    );
  }
}
