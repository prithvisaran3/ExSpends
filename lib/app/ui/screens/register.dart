import 'package:expense/app/ui/widget/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth.dart';
import '../theme/colors.dart';
import '../widget/common_button.dart';
import '../widget/common_loading.dart';
import '../widget/common_textform_field.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Register \n",
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: AppColors.primary,
                                ),
                                text: "Now.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: AuthController.to.registerKey,
                    child: Column(
                      children: [
                        CommonTextFormField(
                            controller: AuthController.to.name,
                            inputType: TextInputType.name,
                            prefixIcon:
                                Icon(Icons.person, color: AppColors.primary),
                            hintText: "Enter your Name",
                            validator: (data) {
                              if (data!.isEmpty || data == "") {
                                return "Name field required";
                              } else if (data.length < 3) {
                                return 'Name minimum 3 character';
                              }
                              return null;
                            }),
                        CommonTextFormField(
                            controller: AuthController.to.email,
                            inputType: TextInputType.emailAddress,
                            prefixIcon: Icon(Icons.email_rounded,
                                color: AppColors.primary),
                            hintText: "Enter your Email",
                            validator: (data) {
                              if (data!.isEmpty || data == "") {
                                return "Email field required";
                              }
                              return null;
                            }),
                        CommonTextFormField(
                            controller: AuthController.to.phone,
                            inputType: TextInputType.number,
                            prefixIcon:
                                Icon(Icons.phone, color: AppColors.primary),
                            hintText: "Enter your Phone Number",
                            validator: (data) {
                              if (data!.isEmpty || data == "") {
                                return "Phone field required";
                              }
                              return null;
                            }),
                        CommonTextFormField(
                          controller: AuthController.to.password,
                          obscureText: true,
                          prefixIcon: Icon(Icons.key, color: AppColors.primary),
                          hintText: "Enter your Password",
                          validator: (data) {
                            if (data!.isEmpty || data == "") {
                              return "Password field required";
                            } else if (data.length < 6) {
                              return "Password atleast 6 character";
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Obx(() => AuthController.to.registerLoading == true
                      ? CommonNormalLoading()
                      : CommonButton(
                          text: "Sign Up",
                          onPressed: () async {
                            if (AuthController.to.registerKey.currentState!
                                .validate()) {
                              AuthController.to.register();
                            }
                          },
                        )),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Divider(
                          color: AppColors.white,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CommonText(text: "or", fontColor: AppColors.white),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Divider(
                          color: AppColors.white,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "Already a Member?  ",
                        fontColor: AppColors.white,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CommonText(
                          text: "Log In",
                          fontWeight: FontWeight.bold,
                          fontColor: AppColors.primary,
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
