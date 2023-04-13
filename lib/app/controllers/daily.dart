import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:get/get.dart';

class DailyController extends GetxController {
  static DailyController get to => Get.put(DailyController());

  DatePickerController controller = DatePickerController();

  var _activeDay = 3.obs;

  get activeDay => _activeDay.value;

  set activeDay(value) {
    _activeDay.value = value;
  }

  var _selectedDate = "".obs;

  get selectedDate => _selectedDate.value;

  set selectedDate(value) {
    _selectedDate.value = value;
  }
}
