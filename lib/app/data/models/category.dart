class CategoryRes {
  CategoryRes({
    this.status,
    this.message,
    this.data,
  });

  dynamic status;
  dynamic message;
  List<Datum>? data;

  factory CategoryRes.fromMap(Map<String, dynamic> json) => CategoryRes(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.id,
    this.categoryName,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  dynamic categoryName;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_name": categoryName,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
