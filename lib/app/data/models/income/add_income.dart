class AddIncomeRes {
  AddIncomeRes({
    this.status,
    this.message,
    this.data,
  });

  dynamic status;
  dynamic message;
  Data? data;

  factory AddIncomeRes.fromMap(Map<String, dynamic> json) => AddIncomeRes(
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
    this.userName,
    this.userEmail,
    this.incomeName,
    this.amount,
    this.date,
    this.isIncome,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  dynamic userId;
  dynamic userName;
  dynamic userEmail;
  dynamic incomeName;
  dynamic amount;
  dynamic date;
  dynamic isIncome;
  dynamic updatedAt;
  dynamic createdAt;
  dynamic id;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        incomeName: json["income_name"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        isIncome: json["is_income"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "income_name": incomeName,
        "amount": amount,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "is_income": isIncome,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
