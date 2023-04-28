
import 'package:get/get.dart';

import '../theme/colors.dart';

commonSnackBar({required title, dynamic msg}) {
  Get.snackbar(
    "$title",
    msg,
    barBlur: 2,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.primary,
    overlayBlur: 2,
  );
}

alertSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg",
      backgroundColor: AppColors.red,
      snackStyle: SnackStyle.FLOATING,
      colorText: AppColors.white);
}

nothingSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.BOTTOM);
}

successSnackBar({required msg}) {
  Get.snackbar("Alert", "$msg", snackPosition: SnackPosition.TOP);
}
