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
  Future<dynamic> deleteExpense({required body})async{
    var response= await helper.post(url: ApiService.deleteExpense,body:body,auth: true);
    var res= jsonDecode(response);
    return res;
  }
  Future<dynamic> deleteIncome({required body})async{
    var response= await helper.post(url: ApiService.deleteIncome,body:body,auth: true);
    var res= jsonDecode(response);
    return res;
  }

}