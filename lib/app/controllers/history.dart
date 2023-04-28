import 'package:expense/app/data/repository/history.dart';
import 'package:expense/app/ui/widget/common_print.dart';
import 'package:expense/app/ui/widget/common_toast.dart';
import 'package:get/get.dart';

import '../data/models/income/getincome.dart';
import '../data/models/expense/getexpense.dart' as expense;

class HistoryController extends GetxController {
  static HistoryController get to => Get.put(HistoryController());
  var repository = HistoryRepository();

  var _isExpense = true.obs;

  get isExpense => _isExpense.value;

  set isExpense(value) {
    _isExpense.value = value;
  }

  var _activeCategory = 3.obs;

  get activeCategory => _activeCategory.value;

  set activeCategory(value) {
    _activeCategory.value = value;
  }

  var _h1index = 2.obs;

  get h1index => _h1index.value;

  set h1index(value) {
    _h1index.value = value;
  }

  var _h2index = 1.obs;

  get h2index => _h2index.value;

  set h2index(value) {
    _h2index.value = value;
  }



  var _getIncomeDetails = <Datum>[].obs;

  get getIncomeDetails => _getIncomeDetails.value;

  set getIncomeDetails(value) {
    _getIncomeDetails.value = value;
  }
  var _getExpenseDetails=<expense.Datum>[].obs;

  get getExpenseDetails => _getExpenseDetails.value;

  set getExpenseDetails(value) {
    _getExpenseDetails.value = value;
  }


  var _expenseDeleteLoading=false.obs;

  get expenseDeleteLoading => _expenseDeleteLoading.value;

  set expenseDeleteLoading(value) {
    _expenseDeleteLoading.value = value;
  }
  var _incomeDeleteLoading=false.obs;

  get incomeDeleteLoading => _incomeDeleteLoading.value;

  set incomeDeleteLoading(value) {
    _incomeDeleteLoading.value = value;
  }

  getIncome() async {
    try {
      var res = await repository.getIncome();
      if (res.status == 200) {
        commonPrint(status: res.status, msg: "Income got successfully");
        if (res.data == null) {
          commonPrint(
              status: res.status,
              msg: "Income got successfully but data is null");
        } else {
          commonPrint(
              status: res.status,
              msg: "Income got successfully and data is stored");
          getIncomeDetails = res.data!.data;
        }
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Exception hit at get income");
    }
  }
  getExpense() async {
    try {
      var res = await repository.getExpense();
      if (res.status == 200) {
        commonPrint(status: res.status, msg: "Expense got successfully");
        if (res.data == null) {
          commonPrint(
              status: res.status,
              msg: "Expense got successfully but data is null");
        } else {
          commonPrint(
              status: res.status,
              msg: "Expense got successfully and data is stored");
          getExpenseDetails = res.data!.data;
        }
      }
    } catch (e) {
      commonPrint(status: "500", msg: "Exception hit at get expense");
    }
  }
  
  deleteExpense({required id})async{
    expenseDeleteLoading=true;
    var body={
      'id':id
    };
    try{
      var res=await repository.deleteExpense(body: body);
      if(res['status']==200)
        {
          expenseDeleteLoading=false;
          commonPrint(status: res['status'], msg: res['message']);
          commonToast(msg: res['message']);
          getExpense();
        }
      else if(res['status']==404)
      {
        expenseDeleteLoading=false;
        commonPrint(status: res['status'], msg: res['message']);
        commonToast(msg: res['message']);
      }
      else if(res['status']==401){
        expenseDeleteLoading=false;
        commonPrint(status: res['status'], msg: res['message']);
        commonToast(msg: res['message']);
      }
      else{
        expenseDeleteLoading=false;
        commonPrint(status: res['status'], msg: "Server Error");
      }
    }catch(e){
      expenseDeleteLoading=false;
      commonPrint(status: "500", msg: "Exception hit at deleteExpense\n $e");
    }
  }
  deleteIncome({required id})async{
    incomeDeleteLoading=true;
    var body={
      'id':id
    };
    try{
      var res=await repository.deleteIncome(body: body);
      if(res['status']==200)
      {
        incomeDeleteLoading=false;
        commonPrint(status: res['status'], msg: res['message']);
        commonToast(msg: res['message']);
        getIncome();
      }
      else if(res['status']==404)
      {
        incomeDeleteLoading=false;
        commonPrint(status: res['status'], msg: res['message']);
        commonToast(msg: res['message']);
      }
      else if(res['status']==401){
        incomeDeleteLoading=false;
        commonPrint(status: res['status'], msg: res['message']);
        commonToast(msg: res['message']);
      }
      else{
        incomeDeleteLoading=false;
        commonPrint(status: res['status'], msg: "Server Error");
      }
    }catch(e){
      incomeDeleteLoading=false;
      commonPrint(status: "500", msg: "Exception hit at deleteIncome\n $e");
    }
  }

}
