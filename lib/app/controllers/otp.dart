import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  static OtpController get to => Get.put(OtpController());

  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  TextEditingController fifth = TextEditingController();
  TextEditingController sixth = TextEditingController();

  late Timer timer;

  final _seconds = 0.obs;

  get seconds => _seconds.value;

  set seconds(value) {
    _seconds.value = value;
  }

  final _isStartResend = false.obs;

  get isStartResend => _isStartResend.value;

  set isStartResend(value) {
    _isStartResend.value = value;
  }

  startTimer() {
    seconds = 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds = seconds - 1;
      isStartResend = true;
      if (seconds == 0) {
        timer.cancel();
        timer.cancel();
      }
      update();
      if (seconds == 0) {
        timer.cancel();
        isStartResend = false;
      }
    });
  }
}
