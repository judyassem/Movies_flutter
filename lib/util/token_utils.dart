import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token) async{
  final pref = await SharedPreferences.getInstance();
  await pref.setString("auth_token", token);
}

Future<String?> getToken() async{
  final pref = await SharedPreferences.getInstance();
  return pref.getString("auth_token");
}