import 'package:get/get.dart';

int statusCode = 0;

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  final _pageIndex = 0.obs;

  get pageIndex => _pageIndex.value;

  set pageIndex(value) {
    _pageIndex.value = value;
  }
}
