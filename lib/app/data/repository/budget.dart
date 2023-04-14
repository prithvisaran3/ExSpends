import 'dart:convert';
import '../../services/api.dart';
import '../../services/http_service.dart';
import '../models/category.dart';
import '../models/expense/add_expense.dart';
import '../models/income/add_income.dart';

class BudgetRepository {
  final HttpHelper helper = HttpHelper();

  Future<CategoryRes> getCategories() async {
    var response = await helper.get(url: ApiService.getCategory);
    var res = CategoryRes.fromMap(jsonDecode(response));
    return res;
  }

  Future<AddExpenseRes> addExpense({required body}) async {
    var response =
        await helper.post(url: ApiService.addExpense, body: body, auth: true);
    var res = AddExpenseRes.fromMap(jsonDecode(response));
    return res;
  }

  Future<AddIncomeRes> addIncome({required body}) async {
    var response =
        await helper.post(url: ApiService.addIncome, body: body, auth: true);
    var res = AddIncomeRes.fromMap(jsonDecode(response));
    return res;
  }
}
