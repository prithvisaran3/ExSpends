

class DailyRes {
  DailyRes({
    this.status,
    this.message,
    this.dailyTotalIncome,
    this.dailyTotalExpense,
    this.data,
  });

  dynamic status;
  dynamic message;
  dynamic dailyTotalIncome;
  dynamic dailyTotalExpense;
  List<Datum>? data;

  factory DailyRes.fromMap(Map<String, dynamic> json) => DailyRes(
    status: json["status"],
    message: json["message"],
    dailyTotalIncome: json["daily_total_income"],
    dailyTotalExpense: json["daily_total_expense"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "daily_total_income": dailyTotalIncome,
    "daily_total_expense": dailyTotalExpense,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.userName,
    this.userEmail,
    this.incomeName,
    this.amount,
    this.date,
    this.isIncome,
    this.createdAt,
    this.updatedAt,
    this.expenseCategory,
    this.expenseName,
  });

  dynamic id;
  dynamic userId;
  dynamic userName;
  dynamic userEmail;
  dynamic incomeName;
  dynamic amount;
  dynamic date;
  dynamic isIncome;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic expenseCategory;
  dynamic expenseName;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    incomeName: json["income_name"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
    isIncome: json["is_income"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expenseCategory: json["expense_category"],
    expenseName: json["expense_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "user_name": userName,
    "user_email": userEmail,
    "income_name": incomeName,
    "amount": amount,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "is_income": isIncome,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "expense_category": expenseCategory,
    "expense_name": expenseName,
  };
}
