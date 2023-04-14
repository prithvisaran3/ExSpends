import '../config/app-config.dart';

class ApiService {
  // auth
  static const login = "${AppConfig.baseUrl}/api/login";
  static const register = "${AppConfig.baseUrl}/api/register";
  static const logout = "${AppConfig.baseUrl}/api/logout";

  //profile
  static const getProfile = "${AppConfig.baseUrl}/api/profile/get";
  static const getTotal = "${AppConfig.baseUrl}/api/getTotalIncomeAndExpense";
  // static const updateProfile = "${AppConfig.baseUrl}action=updateprofile";

  //forgot password
  static const validateEmail = "${AppConfig.baseUrl}action=validateEmail";

  //update password
  static const updatePassword = "${AppConfig.baseUrl}action=updatePassword";
//daily transactions
  static const getDaily = "${AppConfig.baseUrl}/api/allTransactions";




  //category
  static const getCategory = "${AppConfig.baseUrl}/api/category/get";

  //expense
  static const addExpense = "${AppConfig.baseUrl}/api/expense/add";
  static const getExpense = "${AppConfig.baseUrl}/api/expense/get";

  //profile

  //income
  static const addIncome = "${AppConfig.baseUrl}/api/income/add";
  static const getIncome = "${AppConfig.baseUrl}/api/income/get";

  //statistics
  static const getStats = "${AppConfig.baseUrl}/api/getStatistics";

}
