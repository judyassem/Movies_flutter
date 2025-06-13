class LoginUserResponse {
   String? message;
   String? data;

  LoginUserResponse({this.message, this.data});

  LoginUserResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data']; // Token string
  }
}
