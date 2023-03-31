import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


commonSnackBar({required title, required msg}) {
  Get.snackbar(title, msg, snackPosition: SnackPosition.BOTTOM);
}

alertSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg",
      backgroundColor: red,
      snackStyle: SnackStyle.FLOATING,
      colorText: white);
}

nothingSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.BOTTOM);
}

successSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.TOP);
}
