class LoginUserResponse {
   String? message;
   String? data;

  LoginUserResponse({this.message, this.data});

   LoginUserResponse.fromJson(Map<String, dynamic> json) {
     final msg = json['message'];
     message = msg is List ? msg.join(', ') : msg?.toString();
     data = json['data']?.toString();
   }
}
