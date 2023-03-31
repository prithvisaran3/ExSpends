import 'package:budget_tracker_ui/functions/function.dart';
import 'package:budget_tracker_ui/model/user.dart';
import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';

import '../widget/common_button.dart';
import '../widget/common_textform_field.dart';
import 'login_page.dart';

class esignup extends StatelessWidget {
  esignup({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final registerkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: black,
          ),
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
                              color: white,
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "Register \n",
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: primary,
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
                    key: registerkey,
                    child: Column(
                      children: [
                        nameField(),
                        phonenoField(),
                        emailField(),
                        passwordField(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  signupButton(context),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Divider(
                          color: white,
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "or",
                        style: TextStyle(color: white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 10,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Divider(
                          color: white,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already a Member?  ",
                        style: TextStyle(
                          color: white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
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

  CommonButton signupButton(BuildContext context) {
    return CommonButton(
      text: "SignUp",
      onPressed: () async {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return Login();
        // }));
        if (registerkey.currentState!.validate()) {
          signup(
              context: context,
              name: nameController.text,
              phone: phoneController.text,
              email: emailController.text,
              password: passwordController.text,);
        }
      },
    );
  }

  CommonTextFormField passwordField() {
    return CommonTextFormField(
      controller: passwordController,
      obscureText: true,
      prefixIcon: Icon(Icons.key, color: primary),
      hintText: "Enter your Password",
      validator: (data) {
        if (data!.isEmpty || data == "") {
          return "Password field required";
        } else if (data.length < 2) {
          return "Password atleast 6 character";
        }
        return null;
      },
    );
  }

  CommonTextFormField emailField() {
    return CommonTextFormField(
        controller: emailController,
        inputType: TextInputType.emailAddress,
        prefixIcon: Icon(Icons.email_rounded, color: primary),
        hintText: "Enter your Email",
        validator: (data) {
          if (data!.isEmpty || data == "") {
            return "Email field required";
          }
          return null;
        });
  }

  CommonTextFormField phonenoField() {
    return CommonTextFormField(
        controller: phoneController,
        inputType: TextInputType.number,
        prefixIcon: Icon(Icons.phone, color: primary),
        hintText: "Enter your Phone Number",
        validator: (data) {
          if (data!.isEmpty || data == "") {
            return "Phone field required";
          }
          return null;
        });
  }

  CommonTextFormField nameField() {
    return CommonTextFormField(
        controller: nameController,
        inputType: TextInputType.name,
        prefixIcon: Icon(Icons.person, color: primary),
        hintText: "Enter your Name",
        validator: (data) {
          if (data!.isEmpty || data == "") {
            return "Name field required";
          }
          return null;
        });
  }
}
