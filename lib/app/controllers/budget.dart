import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/category.dart';
import '../data/repository/budget.dart';
import '../ui/widget/common_print.dart';
import '../ui/widget/common_toast.dart';

class BudgetController extends GetxController {
  static BudgetController get to => Get.put(BudgetController());

  //expense textControllers
   TextEditingController expenseDate = TextEditingController();
  final TextEditingController expenseName = TextEditingController();
  final TextEditingController expenseAmount = TextEditingController();

  //income textControllers
  final TextEditingController incomeCategory = TextEditingController();
  final TextEditingController incomeDate = TextEditingController();
  final TextEditingController incomeAmount = TextEditingController();

  final expenseKey = GlobalKey<FormState>();
  final incomeKey = GlobalKey<FormState>();

  final repository = BudgetRepository();

  var _selectedIndex = 0.obs;

  get selectedIndex => _selectedIndex.value;

  set selectedIndex(value) {
    _selectedIndex.value = value;
  }

  var _categoryIndex = 30.obs;

  get categoryIndex => _categoryIndex.value;

  set categoryIndex(value) {
    _categoryIndex.value = value;
  }

  var _categoryLoading = false.obs;

  get categoryLoading => _categoryLoading.value;

  set categoryLoading(value) {
    _categoryLoading.value = value;
  }

  var _categoryDetails = <Datum>[].obs;

  get categoryDetails => _categoryDetails.value;

  set categoryDetails(value) {
    _categoryDetails.value = value;
  }

  var _isCategoryEmpty = false.obs;

  get isCategoryEmpty => _isCategoryEmpty.value;

  set isCategoryEmpty(value) {
    _isCategoryEmpty.value = value;
  }

  var _selectedCategory = "".obs;

  get selectedCategory => _selectedCategory.value;

  set selectedCategory(value) {
    _selectedCategory.value = value;
  }

  var _addExpenseLoading = false.obs;

  get addExpenseLoading => _addExpenseLoading.value;

  set addExpenseLoading(value) {
    _addExpenseLoading.value = value;
  }

  var _addIncomeLoading = false.obs;

  get addIncomeLoading => _addIncomeLoading.value;

  set addIncomeLoading(value) {
    _addIncomeLoading.value = value;
  }



  expenseFieldsEmpty() {
    expenseName.text = "";
    expenseDate.text = "";
    expenseAmount.text = "";
    selectedCategory = "";
    categoryIndex = 30;
  }

  incomeFieldsEmpty() {
    incomeCategory.text = "";
    incomeDate.text = "";
    incomeAmount.text = "";
  }

  getCategories() async {
    categoryLoading = true;
    try {
      var res = await repository.getCategories();
      if (res.status == 200) {
        categoryLoading = false;
        commonPrint(status: res.status, msg: res.message);
        if (res.data == null || res.data!.isEmpty) {
          isCategoryEmpty = true;
          commonPrint(
              status: res.status, msg: "category get successfully bt no data");
        } else {
          isCategoryEmpty = false;
          categoryDetails = res.data;
          commonPrint(
              status: res.status, msg: "category get successfully with data");
        }
      } else {
        categoryLoading = false;
        commonPrint(status: "404", msg: "get category failed");
      }
    } catch (e) {
      categoryLoading = false;
      commonPrint(status: "500", msg: "Error from server on get categories $e");
    }
  }

  addExpense() async {
    addExpenseLoading = true;
    var body = {
      "expense_name": expenseName.text,
      "expense_category": selectedCategory,
      "is_income": "false",
      "date": expenseDate.text,
      "amount": expenseAmount.text,
    };
    try {
      var res = await repository.addExpense(body: body);
      if (res.status == 200) {
        addExpenseLoading = false;
        expenseFieldsEmpty();
        commonPrint(status: res.status, msg: res.message);
        commonToast(msg: res.message);
      } else {
        addExpenseLoading = false;
        commonPrint(
            status: res.status, msg: "Add expense failed, try again later");
        commonToast(msg: "Add expense failed, try again later");
      }
    } catch (e) {
      addExpenseLoading = false;
      commonPrint(status: "500", msg: "Error from server on add expense $e");
    }
  }

  addIncome() async {
    addIncomeLoading = true;
    var body = {
      "income_name": incomeCategory.text,
      "amount": incomeAmount.text,
      "date": incomeDate.text,
      "is_income": "true",
    };
    try {
      var res = await repository.addIncome(body: body);
      if (res.status == 200) {
        addIncomeLoading = false;
        incomeFieldsEmpty();
        commonPrint(status: res.status, msg: res.message);
        commonToast(msg: res.message);
      } else {
        addIncomeLoading = false;
        commonPrint(
            status: res.status, msg: "Add income failed, try again later");
        commonToast(msg: "Add income failed, try again later");
      }
    } catch (e) {
      addIncomeLoading = false;
      commonPrint(status: "500", msg: "Error from server on add income $e");
    }
  }
}
