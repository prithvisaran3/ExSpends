
import 'package:expense/app/data/repository/settings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../ui/widget/common_alert.dart';
import '../ui/widget/common_print.dart';
import 'main.dart';




class SettingsController extends GetxController {
  static SettingsController get to => Get.put(SettingsController());

  final repository=SettingsRepository();
  final TextEditingController bugTitle = TextEditingController();
  final TextEditingController bugDescription = TextEditingController();

  final bugKey = GlobalKey<FormState>();

  final _bugLoading = false.obs;

  get bugLoading => _bugLoading.value;

  set bugLoading(value) {
    _bugLoading.value = value;
  }

  bugFieldsEmpty() {
    bugTitle.text = "";
    bugDescription.text = "";
  }

  sendBug() async {
    bugLoading = true;
    var body = {
      "title": bugTitle.text,
      "description":bugDescription.text
    };
    print("body is $body");
    try {
      var res = await repository.sendBug(body: body);
      if (res['status'] == 200) {
        bugLoading = false;
        commonPrint(status: res['status'], msg: res['message']);
        Get.back();
        bugFieldsEmpty();
      } else if (res['status'] == 422) {
        bugLoading = false;
        commonPrint(status: res['status'], msg: "${res['message']}");
        errorAlert(Get.context!, content: "${res['message']}",
            confirmButtonPressed: () {
              Get.back();
            });
      } else if (res['status'] == 404) {
        bugLoading = false;
        commonPrint(status: res['status'], msg: "${res['message']}");
        errorAlert(Get.context!, content: "${res['message']}",
            confirmButtonPressed: () {
              Get.back();
            });
      } else {
        bugLoading = false;
        commonPrint(
            status: res['status'], msg: "Error from server or No Internet");
      }
    } catch (e) {
      bugLoading = false;
      commonPrint(
          status: "500",
          msg: "Exception hit at bug report\n $e");
    }
  }


}
