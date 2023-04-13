import '../config/app-config.dart';

class ApiService {
  // auth
  static const login = "${AppConfig.baseUrl}/api/login";
  static const register = "${AppConfig.baseUrl}/api/register";

  //profile
  static const getProfile = "${AppConfig.baseUrl}/profile/get";
  static const updateProfile = "${AppConfig.baseUrl}action=updateprofile";

  //forgot password
  static const validateEmail = "${AppConfig.baseUrl}action=validateEmail";

  //update password
  static const updatePassword = "${AppConfig.baseUrl}action=updatePassword";

  //category
  static const getCategory = "${AppConfig.baseUrl}/api/category/get";

  //expense
  static const addExpense = "${AppConfig.baseUrl}/api/expense/add";

  //income
  static const addIncome = "${AppConfig.baseUrl}/api/income/add";
}
