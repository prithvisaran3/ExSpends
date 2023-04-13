import 'dart:convert';

import '../../services/api.dart';
import '../../services/http_service.dart';


class AuthRepository {
  final HttpHelper helper = HttpHelper();

  Future<dynamic> login({required body}) async {
    var response = await helper.post(url: ApiService.login, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> register({required body}) async {
    var response = await helper.post(url: ApiService.register, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> validateEmailForForgotPassword({required body}) async {
    var response = await helper.post(url: ApiService.validateEmail, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> updatePassword({required body}) async {
    var response =
        await helper.post(url: ApiService.updatePassword, body: body);
    var res = jsonDecode(response);
    return res;
  }
}
