import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';

import '../widget/common_button.dart';
import '../widget/common_textform_field.dart';
import 'login_page.dart';

class esignup extends StatelessWidget {
  const esignup({Key? key}) : super(key: key);

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

                CommonTextFormField(
                    prefixIcon: Icon(Icons.person, color: primary),
                    hintText: "Enter your Name",
                    // controller: AuthController.to.lEmail,
                    validator: (data) {
                      if (data!.isEmpty || data == "") {
                        return "Name field required";
                      }
                      return null;
                    }),
                // TextFormField(
                //   keyboardType: TextInputType.name,
                //   decoration: InputDecoration(
                //     prefixIcon: Align(
                //       widthFactor: 1.0,
                //       heightFactor: 1.0,
                //       child: Icon(
                //         Icons.person,
                //         color: ePrimaryColor,
                //       ),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide:  BorderSide(color: ewhite),
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //     hintText: "Name",
                //     hintStyle: TextStyle(color: ewhite),
                //   ),
                // ),

                CommonTextFormField(
                    prefixIcon: Icon(Icons.phone, color: primary),
                    hintText: "Enter your Phone Number",
                    // controller: AuthController.to.lEmail,
                    validator: (data) {
                      if (data!.isEmpty || data == "") {
                        return "Phone Number field required";
                      }
                      return null;
                    }),

                CommonTextFormField(
                    prefixIcon: Icon(Icons.email_rounded, color: primary),
                    hintText: "Enter your Email",
                    // controller: AuthController.to.lEmail,
                    validator: (data) {
                      if (data!.isEmpty || data == "") {
                        return "Email field required";
                      }
                      return null;
                    }),

                CommonTextFormField(
                    prefixIcon: Icon(Icons.key, color: primary),
                    hintText: "Enter your Password",
                    // controller: AuthController.to.lEmail,
                    validator: (data) {
                      if (data!.isEmpty || data == "") {
                        return "Password field required";
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                CommonButton(
                    text: "SignUp",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return esignup();
                      }));
                    }),
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
                          return login();
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
    );
  }
}
