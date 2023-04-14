
class StatisticsRes {
  StatisticsRes({
    this.status,
    this.message,
    this.monthlyIncome,
    this.monthlyExpense,
    this.categoryExpenseAmount,
    this.data,
  });

  dynamic status;
  dynamic message;
  dynamic monthlyIncome;
  dynamic monthlyExpense;
  List<CategoryExpenseAmount>? categoryExpenseAmount;
  Data? data;

  factory StatisticsRes.fromMap(Map<String, dynamic> json) => StatisticsRes(
    status: json["status"],
    message: json["message"],
    monthlyIncome: json["monthly_income"],
    monthlyExpense: json["monthly_expense"],
    categoryExpenseAmount: List<CategoryExpenseAmount>.from(json["category_expense_amount"].map((x) => CategoryExpenseAmount.fromMap(x))),
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "monthly_income": monthlyIncome,
    "monthly_expense": monthlyExpense,
    "category_expense_amount": List<dynamic>.from(categoryExpenseAmount!.map((x) => x.toMap())),
    "data": data!.toMap(),
  };
}

class CategoryExpenseAmount {
  CategoryExpenseAmount({
    this.expenseCategory,
    this.amount,
  });

  dynamic expenseCategory;
  dynamic amount;

  factory CategoryExpenseAmount.fromMap(Map<String, dynamic> json) => CategoryExpenseAmount(
    expenseCategory: json["expense_category"],
    amount: json["amount"],
  );

  Map<String, dynamic> toMap() => {
    "expense_category": expenseCategory,
    "amount": amount,
  };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  dynamic currentPage;
  List<Datum>? data;
  dynamic firstPageUrl;
  dynamic from;
  dynamic lastPage;
  dynamic lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  dynamic path;
  dynamic perPage;
  dynamic prevPageUrl;
  dynamic to;
  dynamic total;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links!.map((x) => x.toMap())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.userName,
    this.userEmail,
    this.expenseCategory,
    this.amount,
    this.date,
    this.expenseName,
    this.isIncome,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  dynamic userId;
  dynamic userName;
  dynamic userEmail;
  dynamic expenseCategory;
  dynamic amount;
  dynamic date;
  dynamic expenseName;
  dynamic isIncome;
  dynamic createdAt;
  dynamic updatedAt;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    userName: json["user_name"],
    userEmail: json["user_email"],
    expenseCategory: json["expense_category"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
    expenseName: json["expense_name"],
    isIncome: json["is_income"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "user_name": userName,
    "user_email": userEmail,
    "expense_category": expenseCategory,
    "amount": amount,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "expense_name": expenseName,
    "is_income": isIncome,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  dynamic url;
  dynamic label;
  dynamic active;

  factory Link.fromMap(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toMap() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
