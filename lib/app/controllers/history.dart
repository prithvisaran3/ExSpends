import 'package:get/get.dart';

class HistoryController extends GetxController {
  static HistoryController get to => Get.put(HistoryController());

  var _isExpense = true.obs;

  get isExpense => _isExpense.value;

  set isExpense(value) {
    _isExpense.value = value;
  }

  var _activeCategory = 3.obs;

  get activeCategory => _activeCategory.value;

  set activeCategory(value) {
    _activeCategory.value = value;
  }

  var _h1index = 2.obs;

  get h1index => _h1index.value;

  set h1index(value) {
    _h1index.value = value;
  }

  var _h2index = 1.obs;

  get h2index => _h2index.value;

  set h2index(value) {
    _h2index.value = value;
  }
}
