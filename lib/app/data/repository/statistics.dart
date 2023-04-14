import 'dart:convert';

import 'package:expense/app/services/api.dart';

import '../../services/http_service.dart';
import '../models/statistics.dart';

class StatisticsRepository {
  final HttpHelper helper = HttpHelper();

  Future<StatisticsRes> getStats({required params}) async {
    var response = await helper.get(url: "${ApiService.getStats}?$params",auth: true);
    var res = StatisticsRes.fromMap(jsonDecode(response));
    return res;
  }
}
