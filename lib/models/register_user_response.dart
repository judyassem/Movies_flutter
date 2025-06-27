import 'package:movies_app/models/user_dm.dart';

class RegisterUserResponse {
  RegisterUserResponse({
    this.message,
    this.data,});

  RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? UserDm.fromJson(json['data']) : null;
  }
  String? message;
  UserDm? data;

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.toJson(),
    };
  }
}
