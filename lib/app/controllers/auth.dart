import 'package:expense/app/ui/screens/auth/login.dart';
import 'package:expense/app/ui/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repository/auth.dart';
import '../ui/screens/home/main.dart';
import '../ui/screens/auth/initial.dart';
import '../ui/widget/common_alert.dart';
import '../ui/widget/common_print.dart';
import '../ui/widget/common_snackbar.dart';
import 'main.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  final repository = AuthRepository();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController name = TextEditingController();

  final TextEditingController lEmail = TextEditingController();
  final TextEditingController lPassword = TextEditingController();

  // validate phone controller
  TextEditingController vphone = TextEditingController();

  // update password controller
  TextEditingController uPassword = TextEditingController();
  TextEditingController cuPassword = TextEditingController();

  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();
  final validateEmailKey = GlobalKey<FormState>();
  final updatePasswordKey = GlobalKey<FormState>();


  final _loginLoading = false.obs;

  get loginLoading => _loginLoading.value;

  set loginLoading(value) {
    _loginLoading.value = value;
  }

  final _registerLoading = false.obs;

  get registerLoading => _registerLoading.value;

  set registerLoading(value) {
    _registerLoading.value = value;
  }
  final _phoneValidateLoading = false.obs;

  get phoneValidateLoading => _phoneValidateLoading.value;

  set phoneValidateLoading(value) {
    _phoneValidateLoading.value = value;
  }
  final _updatePasswordLoading = false.obs;

  get updatePasswordLoading => _updatePasswordLoading.value;

  set updatePasswordLoading(value) {
    _updatePasswordLoading.value = value;
  }

  final _loginErrorAnimation=false.obs;

  get loginErrorAnimation => _loginErrorAnimation.value;

  set loginErrorAnimation(value) {
    _loginErrorAnimation.value = value;
  }


  checkOnBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('on_boarding');
    if (token == null) {
      return true;
    } else {
      return false;
    }
  }

  setOnBoardDataAfterScreenCompleted() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("on_boarding", "onBoarding");
    var onBoard = preferences.getString('on_boarding');
    debugPrint("on boarding data $onBoard");
    await Get.off(() =>  Initial());
    return onBoard;
  }


  storeLocalDevice({required Map body}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    body.forEach((key, value) {
      debugPrint('index=$key, value=$value');
      preferences.setString(key, value);
    });
  }

  registerFieldsEmpty() {
    name.text = "";
    email.text = "";
    phone.text = "";
    password.text = "";
  }

  loginFieldsEmpty() {
    lEmail.text = "";
    lPassword.text = "";
  }

  loginCheck() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    debugPrint("token $token");
    if (token != null && token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  login() async {
    loginLoading = true;
    var body = {"email": lEmail.text.trimRight(), "password": lPassword.text};
    try {
      var res = await repository.login(body: body);
      if (res['status'] == 200) {
        loginLoading = false;
        commonPrint(status: res['status'], msg: res['message']);
        Map storedData = {"token": "${res['token']}"};
        storeLocalDevice(body: storedData);
        Get.off(() => HomeMain());
        commonSnackBar(title: "Success", msg: "Login Successfully");
        loginFieldsEmpty();
      } else if (res['status'] == 422) {
        loginLoading = false;
        loginErrorAnimation=true;
        commonPrint(status: res['status'], msg: "${res['message']}");
        loginSnackBar(title: "Try Again", msg: "${res['message']}");
      } else if (res['status'] == 404) {
        loginLoading = false;
        loginErrorAnimation=true;
        commonPrint(status: res['status'], msg: "${res['message']}");
        loginSnackBar(title: "Try Again", msg: "${res['message']}");
      } else {
        loginLoading = false;
        loginErrorAnimation=true;
        commonPrint(
            status: res['status'], msg: "Error from server or No Internet");
        loginSnackBar(title: "Try Again", msg: "${res['message']}");
      }
    } catch (e) {
      loginLoading = false;
      loginErrorAnimation=true;
      commonPrint(
          status: "$statusCode",
          msg: "Error from login due to data mismatch or format $e");
      loginSnackBar(title: "Try Again", msg: "Exception Error");
    }
  }

  register() async {
    registerLoading = true;
    var body = {
      "name": name.text,
      "email": email.text.trimRight(),
      "phone": phone.text,
      "password": password.text
    };
    print("body is $body");
    try {
      var res = await repository.register(body: body);
      if (res['status'] == 200) {
        registerLoading = false;
        commonPrint(status: res['status'], msg: res['message']);
        Map storedData = {"token": "${res['token']}"};
        storeLocalDevice(body: storedData);
        Get.off(() => Login());
        commonSnackBar(title: "Register", msg: "Registered Successfully");
        loginFieldsEmpty();
      } else if (res['status'] == 422) {
        registerLoading = false;
        commonPrint(status: res['status'], msg: "${res['message']}");
        errorAlert(Get.context!, content: "${res['message']}",
            confirmButtonPressed: () {
          Get.back();
        });
      } else if (res['status'] == 404) {
        registerLoading = false;
        commonPrint(status: res['status'], msg: "${res['message']}");
        errorAlert(Get.context!, content: "${res['message']}",
            confirmButtonPressed: () {
          Get.back();
        });
      } else {
        registerLoading = false;
        commonPrint(
            status: res['status'], msg: "Error from server or No Internet");
      }
    } catch (e) {
      registerLoading = false;
      commonPrint(
          status: "$statusCode",
          msg: "Error from register due to data mismatch or format $e");
    }
  }
  updatePassword() async {
    // updatePasswordLoading = true;
    // var body = {
    //   "password": cuPassword.text,
    //   "login_id": validEmailLoginId == "" ? "1090" : validEmailLoginId
    // };
    // try {
    //   var res = await repository.updatePassword(body: body);
    //   if (statusCode == 200) {
    //     if (res['status'] == "200") {
    //       if (res['patient_id'] == null) {
    //         updatePasswordLoading = false;
    //         commonPrint(
    //             status: res['status'], msg: "${res['message']} but no data");
    //       } else {
    //         updatePasswordLoading = false;
    //         commonPrint(
    //             status: res['status'],
    //             msg:
    //                 "${res['message']} with data or patient id: ${res['patient_id']}");
    //         Get.off(() => const Login());
    //         nothingSnackBar(msg: "${res['message']}");
    //       }
    //     } else if (res['status'] == "422") {
    //       updatePasswordLoading = false;
    //       commonPrint(
    //           status: res['status'], msg: "${res['message']} on password");
    //       nothingSnackBar(msg: "Password update error please try again later");
    //     }
    //   } else {
    //     updatePasswordLoading = false;
    //     commonPrint(
    //         status: "500",
    //         msg: "Error from server or No Internet on updatePassword");
    //   }
    // } catch (e) {
    //   updatePasswordLoading = false;
    //   commonPrint(
    //       status: "$statusCode",
    //       msg: "Error from updatePassword due to data mismatch or format $e");
    // }
  }

}
