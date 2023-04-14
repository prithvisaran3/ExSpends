import 'dart:convert';

import 'package:expense/app/services/api.dart';

import '../../services/http_service.dart';
import '../models/profile/logout.dart';
import '../models/profile/profile.dart';
import '../models/profile/totalincomeandexpense.dart';

class ProfileRepository {
  final HttpHelper helper = HttpHelper();

  Future<ProfileRes> getProfile() async {
    var response = await helper.get(url: ApiService.getProfile,auth: true);
    var res = ProfileRes.fromMap(jsonDecode(response));
    return res;
  }
  Future<TotalRes> getTotal() async {
    var response = await helper.get(url: ApiService.getTotal,auth: true);
    var res = TotalRes.fromMap(jsonDecode(response));
    return res;
  }

  Future<LogoutRes> logout()async{
    var response=await helper.get(url: ApiService.logout,auth: true);
    var res=LogoutRes.fromMap(jsonDecode(response));
    return res;
  }

}
