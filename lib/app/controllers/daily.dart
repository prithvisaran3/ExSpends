  import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:expense/app/data/repository/daily.dart';
import 'package:expense/app/utility/utility.dart';
import 'package:get/get.dart';

import '../data/models/daily.dart';
import '../ui/widget/common_print.dart';

class DailyController extends GetxController {
  static DailyController get to => Get.put(DailyController());

  DatePickerController controller = DatePickerController();

  final repository = DailyRepository();
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

  var _dailyloading = false.obs;

  get dailyloading => _dailyloading.value;

  set dailyloading(value) {
    _dailyloading.value = value;
  }

  var _dailydetails = <Datum>[].obs;

  get dailydetails => _dailydetails.value;

  set dailydetails(value) {
    _dailydetails.value = value;
  }
  var _dailytotal=DailyRes().obs;

  get dailytotal => _dailytotal.value;

  set dailytotal(value) {
    _dailytotal.value = value;
  }
  var _grandtotaldaily = 0.obs;

  get grandtotaldaily => _grandtotaldaily.value;

  set grandtotaldaily(value) {
    _grandtotaldaily.value = value;
  }

  var _dailyEmpty=false.obs;

  get dailyEmpty => _dailyEmpty.value;

  set dailyEmpty(value) {
    _dailyEmpty.value = value;
  }

  getDailyTransactions() async {
    dailyloading = true;
    try {
      print("Get daily init");
      var senddate = getIsoToLocalDateDaily(date: selectedDate.toString());
      print("Converted date is $senddate");

      var params = "date=$senddate";
      var res = await repository.getDaily(params: params);
      if (res.status == 200) {
        dailyloading = false;
        commonPrint(status: res.status, msg: "Daily Transaction api got successfully");
        if (res.data == null||res.data!.isEmpty) {
          dailyEmpty=true;
          dailyloading = false;
          commonPrint(
              status: res.status, msg: "Daily Transactions got successfully but no data");

          grandtotaldaily=0;
          dailytotal.dailyTotalIncome=0;
          dailytotal.dailyTotalExpense=0;
        } else {
          dailyEmpty=false;
          dailyloading = false;
          commonPrint(
              status: res.status, msg: "Daily Transactions got successfully with data");
          dailydetails = res.data;
          dailytotal=res;
          grandtotaldaily=dailytotal.dailyTotalIncome-dailytotal.dailyTotalExpense;
        }
      }
    } catch (e) {
      commonPrint(status:"500", msg: "Exception caught at Daily Page");
    }
  }
}
