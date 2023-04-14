import 'package:expense/app/data/repository/statistics.dart';
import 'package:expense/app/ui/widget/common_print.dart';
import 'package:expense/app/utility/utility.dart';
import 'package:get/get.dart';

import '../data/models/statistics.dart';

class StatisticsController extends GetxController {
  static StatisticsController get to => Get.put(StatisticsController());

  var repository = StatisticsRepository();
  var _statisticsLoading = false.obs;

  get statisticsLoading => _statisticsLoading.value;

  set statisticsLoading(value) {
    _statisticsLoading.value = value;
  }

  var _statisticsDetails = StatisticsRes().obs;

  get statisticsDetails => _statisticsDetails.value;

  set statisticsDetails(value) {
    _statisticsDetails.value = value;
  }


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

  getStatistics() async {
    statisticsLoading = true;
    try {
      var monthNumber = monthsNameToNumber(month: isSelectMonth);
      var params = "month=$monthNumber&year=$isSelectYear";
      var res = await repository.getStats(params: params);
      if (res.status == 200) {
        statisticsLoading = false;
        commonPrint(status: res.status, msg: "Statistics api got successfully");
        if (res.data == null) {
          statisticsLoading = false;

          commonPrint(
              status: res.status, msg: "Stats got successfully but no data");
        } else {
          statisticsLoading = false;

          commonPrint(
              status: res.status, msg: "Stats got successfully with data");
          statisticsDetails = res;
        }
      }
    } catch (e) {
      statisticsLoading = false;
      commonPrint(status: "500", msg: "Exception at getStatistics");
    }
  }
}
