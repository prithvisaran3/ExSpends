class AddExpenseRes {
  AddExpenseRes({
    this.status,
    this.message,
    this.data,
  });

  dynamic status;
  dynamic message;
  Data? data;

  factory AddExpenseRes.fromMap(Map<String, dynamic> json) => AddExpenseRes(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.userId,
    this.userEmail,
    this.userName,
    this.expenseCategory,
    this.amount,
    this.date,
    this.expenseName,
    this.isIncome,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  dynamic userId;
  dynamic userEmail;
  dynamic userName;
  dynamic expenseCategory;
  dynamic amount;
  dynamic date;
  dynamic expenseName;
  dynamic isIncome;
  dynamic updatedAt;
  dynamic createdAt;
  dynamic id;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        userEmail: json["user_email"],
        userName: json["user_name"],
        expenseCategory: json["expense_category"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        expenseName: json["expense_name"],
        isIncome: json["is_income"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "user_email": userEmail,
        "user_name": userName,
        "expense_category": expenseCategory,
        "amount": amount,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "expense_name": expenseName,
        "is_income": isIncome,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
