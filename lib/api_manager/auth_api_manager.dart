import 'dart:convert';
import 'package:http/http.dart';
import 'package:movies_app/models/register_user_response.dart';
import 'package:movies_app/models/user_dm.dart';
import '../models/login_user_response.dart';
import '../util/token_utils.dart';

class AuthApiManager{

  var authBaseUrl = "https://route-movie-apis.vercel.app/";
  var registerEndpoint = "auth/register";
  var loginEndpoint = "auth/login";
  var profileEndpoint = "profile";
  var defaultErrorMessage = "Something went wrong";

  Future<RegisterUserResponse?> registerUser(UserDm user) async {
    try {
      Uri url = Uri.parse("$authBaseUrl$registerEndpoint");
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
    Uri url = Uri.parse("$authBaseUrl$loginEndpoint");
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

  Future<RegisterUserResponse?> getProfile() async {
    Uri url = Uri.parse("$authBaseUrl$profileEndpoint");

    try {
      final token = await getToken(); // retrieve the token
      if (token == null) {
        print("❌ No token found");
        return null;
      }

      final response = await get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("👤 Profile Status: ${response.statusCode}");
      print("👤 Profile Body: ${response.body}");

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return RegisterUserResponse.fromJson(json);
      } else {
        throw "Failed to load profile: ${response.statusCode}";
      }
    } catch (e) {
      print("Get Profile Error: $e");
      return null;
    }
  }

}