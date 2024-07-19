import 'dart:convert';

LoginUserResponse loginUserResponseFromJson(String str) => LoginUserResponse.fromJson(json.decode(str));

String welcomeToJson(LoginUserResponse data) => json.encode(data.toJson());

class LoginUserResponse {
  bool? success;
  int? statusCode;
  String? message;
  Result? result;
  int? time;

  LoginUserResponse({
    this.success,
    this.statusCode,
    this.message,
    this.result,
    this.time,
  });

  LoginUserResponse copyWith({
    bool? success,
    int? statusCode,
    String? message,
    Result? result,
    int? time,
  }) =>
      LoginUserResponse(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        result: result ?? this.result,
        time: time ?? this.time,
      );

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) => LoginUserResponse(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "result": result?.toJson(),
    "time": time,
  };
}

class Result {
  String? id;
  int? status;
  int? userType;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;

  Result({
    this.id,
    this.status,
    this.userType,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  Result copyWith({
    String? id,
    int? status,
    int? userType,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? token,
  }) =>
      Result(
        id: id ?? this.id,
        status: status ?? this.status,
        userType: userType ?? this.userType,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        token: token ?? this.token,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    status: json["status"],
    userType: json["user_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "status": status,
    "user_type": userType,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "token": token,
  };
}
