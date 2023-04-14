import 'dart:convert';

import 'package:expense/app/data/models/expense/getexpense.dart';
import 'package:expense/app/services/api.dart';
import 'package:expense/app/services/http_service.dart';

import '../models/income/getincome.dart';

class HistoryRepository{
  final HttpHelper helper=HttpHelper();

  Future<GetIncomeRes> getIncome()async{
    var response= await helper.get(url: ApiService.getIncome,auth: true);
    var res= GetIncomeRes.fromMap(jsonDecode(response));
    return res;
  }
  Future<GetExpenseRes> getExpense()async{
    var response= await helper.get(url: ApiService.getExpense,auth: true);
    var res= GetExpenseRes.fromMap(jsonDecode(response));
    return res;
  }

}