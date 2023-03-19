import 'dart:math';
import 'dart:ui';

import 'package:budget_tracker_ui/pages/root_app.dart';
import 'package:budget_tracker_ui/pages/signup_page.dart';
import 'package:flutter/material.dart';

import '../theme/app_font.dart';
import '../theme/colors.dart';
import '../widget/common_button.dart';
import '../widget/common_text.dart';
import '../widget/common_textform_field.dart';
// import 'package:slide_to_act/slide_to_act.dart';

class login extends StatelessWidget {
  login({Key ? key}) : super(key: key);

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
                  CommonTextFormField(


                      prefixIcon: Icon(Icons.email, color: primary),
                      hintText: "Enter your email",
                      // controller: AuthController.to.lEmail,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Email field required";
                        }
                        return null;
                      }),
                  CommonTextFormField(
                      prefixIcon: Icon(Icons.lock_open, color: primary),
                      hintText: "Enter your password",
                      obscureText: true,
                      // controller: AuthController.to.lPassword,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "Password field required";
                        } else if (data.length < 2) {
                          return "Password atleast 6 character";
                        }
                        return null;
                      }),
                  SizedBox(height: 15),
                  // SlideAction(
                  //   borderRadius: 12,
                  //   elevation: 0,
                  //   innerColor: ePrimaryColor,
                  //   outerColor: Colors.eblack12,
                  //   sliderButtonIcon: Icon(
                  //     Icons.lock_open,
                  //     size: 15,
                  //   ),
                  //   text: 'Swipe to Login',
                  //   textStyle: TextStyle(
                  //     fontSize: 18,
                  //   ),
                  //   onSubmit: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) {
                  //       return login();
                  //     }));
                  //   },
                  // ),
                  CommonButton(
                    text: "Login",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return RootApp();
                          }));
                    },
                  ),

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
}
