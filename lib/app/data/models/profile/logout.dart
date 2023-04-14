
class LogoutRes {
  LogoutRes({
    this.status,
    this.message,
  });

  dynamic status;
  dynamic message;

  factory LogoutRes.fromMap(Map<String, dynamic> json) => LogoutRes(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
  };
}
