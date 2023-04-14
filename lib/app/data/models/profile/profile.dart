

class ProfileRes {
  ProfileRes({
    this.status,
    this.message,
    this.data,
  });

  dynamic status;
  dynamic message;
  Data? data;

  factory ProfileRes.fromMap(Map<String, dynamic> json) => ProfileRes(
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
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic password;
  dynamic createdAt;
  dynamic updatedAt;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "password": password,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
