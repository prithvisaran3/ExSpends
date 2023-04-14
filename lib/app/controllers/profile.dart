import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/profile.dart';
import '../data/repository/profile.dart';
import '../ui/widget/common_print.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.put(ProfileController());

  var repository = ProfileRepository();


  var _profileDetails = Data().obs;

  get profileDetails => _profileDetails.value;

  set profileDetails(value) {
    _profileDetails.value = value;
  }

  getProfile() async {
    try {
      var res = await repository.getProfile();
      if (res.status == 200) {
        commonPrint(status: res.status, msg: res.message);
        if (res.data == null) {
          commonPrint(
              status: res.status, msg: "Profile get successful but no data");
        } else {
          commonPrint(status: res.status, msg: "Profile get successful");
          profileDetails = res.data;
        }
      } else {
        commonPrint(status: "404", msg: "get profile failed");
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Error from server(Profile Get)");
    }
  }
}
