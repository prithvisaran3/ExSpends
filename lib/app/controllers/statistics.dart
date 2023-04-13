import 'package:get/get.dart';

class StatisticsController extends GetxController {
  static StatisticsController get to => Get.put(StatisticsController());

  var _activeDay = 3.obs;

  get activeDay => _activeDay.value;

  set activeDay(value) {
    _activeDay.value = value;
  }

  var _isSelectYear = "2018".obs;

  get isSelectYear => _isSelectYear.value;

  set isSelectYear(value) {
    _isSelectYear.value = value;
  }

  var _isSelectMonth = "Jan".obs;

  get isSelectMonth => _isSelectMonth.value;

  set isSelectMonth(value) {
    _isSelectMonth.value = value;
  }
}
