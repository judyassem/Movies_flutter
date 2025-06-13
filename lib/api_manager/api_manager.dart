import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/models/register_user_response.dart';
import 'package:movies_app/models/user_dm.dart';

import '../models/login_user_response.dart';

class ApiManager{

  var baseUrl = "https://route-movie-apis.vercel.app/";
  var registerEndpoint = "auth/register";
  var loginEndpoint = "auth/login";
  var defaultErrorMessage = "Something went wrong";

  Future<RegisterUserResponse?> registerUser(UserDm user) async {
    try {
      Uri url = Uri.parse("$baseUrl$registerEndpoint");
      final response = await post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      print("📡 Status Code: ${response.statusCode}");
      print("📦 Response Body: ${response.body}");

      final json = jsonDecode(response.body);
      final result = RegisterUserResponse.fromJson(json);

      return result;
    } catch (e) {
      print("Register API error: $e");
      return RegisterUserResponse(message: "Register API error");
    }
  }


  Future<LoginUserResponse?> loginUser(String email, String password) async {
    Uri url = Uri.parse("$baseUrl$loginEndpoint");
    try {
      var response = await post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      var loginResponse = LoginUserResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        return loginResponse;
      } else {
        throw loginResponse.message ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

}