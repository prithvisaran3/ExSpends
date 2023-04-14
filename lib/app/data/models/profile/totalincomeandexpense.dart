
class TotalRes {
  TotalRes({
    this.status,
    this.message,
    this.totalIncome,
    this.totalExpense,
  });

  dynamic status;
  dynamic message;
  dynamic totalIncome;
  dynamic totalExpense;

  factory TotalRes.fromMap(Map<String, dynamic> json) => TotalRes(
    status: json["status"],
    message: json["message"],
    totalIncome: json["total_income"],
    totalExpense: json["total_expense"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "total_income": totalIncome,
    "total_expense": totalExpense,
  };
}
