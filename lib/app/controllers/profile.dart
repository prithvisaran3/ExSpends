import 'package:expense/app/ui/screens/auth/initial.dart';
import 'package:expense/app/ui/widget/common_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/profile/profile.dart';
import '../data/models/profile/totalincomeandexpense.dart';
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

  var _totalDetails = TotalRes().obs;

  get totalDetails => _totalDetails.value;

  set totalDetails(value) {
    _totalDetails.value = value;
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

  getTotal() async {
    try {
      var res = await repository.getTotal();
      if (res.status == 200) {
        commonPrint(status: res.status, msg: res.message);
        totalDetails = res;
        print("Total Income and expense got successfully");
      } else {
        commonPrint(status: "404", msg: "get Total failed");
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Error from server(Profile Total)");
    }
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      var res = await repository.logout();
      if (res.status == 200) {
        commonPrint(status: res.status, msg: res.message);
        print("Logout Successfully");
        commonSnackBar(title: "LOGOUT", msg: "Logged out Successfully");
        pref.remove('token');
        Get.off(Initial());
      } else {
        commonPrint(status: "404", msg: "Logout failed");
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Exception at logout");
    }
  }
}
