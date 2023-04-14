import 'dart:convert';

import 'package:expense/app/services/api.dart';

import '../../services/http_service.dart';
import '../models/profile.dart';

class ProfileRepository {
  final HttpHelper helper = HttpHelper();

  Future<ProfileRes> getProfile() async {
    var response = await helper.get(url: ApiService.getProfile,auth: true);
    var res = ProfileRes.fromMap(jsonDecode(response));
    return res;
  }
}
