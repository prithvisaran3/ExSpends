import 'package:expense/app/ui/screens/auth/forgot_password.dart';
import 'package:expense/app/ui/screens/auth/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../../controllers/auth.dart';
import '../../theme/app_font.dart';
import '../../theme/colors.dart';
import '../../widget/common_button.dart';
import '../../widget/common_loading.dart';
import '../../widget/common_text.dart';
import '../../widget/common_textform_field.dart';
import 'register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late StateMachineController _controller;

  void _onInit(Artboard art) {
    var ctrl = StateMachineController.fromArtboard(art, 'Login')
        as StateMachineController;
    ctrl.isActive = true;
    art.addController(ctrl);

    setState(() {
      _controller = ctrl;
    });
  }

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
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(right: 80),
                  //     child: RichText(
                  //       text: TextSpan(
                  //         style: TextStyle(
                  //           color: AppColors.white,
                  //           fontSize: 48,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //         text: "Hey,  \nLogin",
                  //         children: [
                  //           TextSpan(
                  //             style: TextStyle(
                  //               color: AppColors.primary,
                  //             ),
                  //             text: " "
                  //                 "Now.",
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Container(
                      height: Get.height * 0.4,
                      child: RiveAnimation.asset('assets/rive/login_bear.riv',
                          onInit: _onInit)),
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
                          onChanged: (data) {
                            if (data!.isNotEmpty || data != "") {
                              setState(() {
                                var typing = _controller.findSMI('hands_up');
                                typing.value = true;
                              });
                            }
                          },
                          onComplete: () {
                            FocusNode().unfocus();
                            setState(() {
                              var typing = _controller.findSMI('hands_up');
                              typing.value = false;
                            });
                          },
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 200.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ForgotPassword());
                      },
                      child: CommonText(
                        text: "Forgot Password?",
                        fontColor: AppColors.white.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Obx(
                    () => AuthController.to.loginLoading == true
                        ? CommonNormalLoading()
                        : CommonButton(
                            text: "Login",
                            onPressed: () {
                              if (AuthController.to.loginKey.currentState!
                                  .validate()) {
                                AuthController.to.login();
                                if(AuthController.to.loginErrorAnimation==true)
                                  {
                                    setState(() {
                                      var error=_controller.findSMI('fail');
                                      error.fire();
                                    });
                                  }
                              }
                            },
                          ),
                  ),
                  SizedBox(height: 20),
                  // CommonButton(
                  //     text: "RIVE",
                  //     onPressed: () {
                  //       print("Rive active ${_controller.isActive}");
                  //       setState(() {
                  //         var example = _controller.findSMI('success');
                  //         print("SMI $example");
                  //         example.fire();
                  //       });
                  //     }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "Don't have an account? ",
                        fontColor: AppColors.white.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => Register());
                        },
                        child: CommonText(
                          text: "Sign up",
                          fontColor: AppColors.primary.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
