import 'dart:convert';

import 'package:expense/app/services/api.dart';

import '../../services/http_service.dart';
import '../models/daily.dart';
import '../models/statistics.dart';

class DailyRepository {
  final HttpHelper helper = HttpHelper();

  Future<DailyRes> getDaily({required params}) async {
    var response =
        await helper.get(url:"${ApiService.getDaily}?$params", auth: true);
    var res = DailyRes.fromMap(jsonDecode(response));
    return res;
  }
}
