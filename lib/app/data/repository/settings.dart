

import 'dart:convert';

import '../../services/api.dart';
import '../../services/http_service.dart';


class SettingsRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> sendBug({required body}) async {
    var response = await helper.post(url: ApiService.bugReport, body: body,auth: true);
    var res = jsonDecode(response);
    return res;
  }


}
