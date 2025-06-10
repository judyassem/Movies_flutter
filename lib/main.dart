import 'package:flutter/material.dart';
import 'package:movies_app/screens_ui/forget_password/forgetpassword_screen.dart';
import 'package:movies_app/screens_ui/login_screen/login_screen.dart';

import 'screens_ui/register_screen/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName: (_) => LoginScreen(),
        ForgetpasswordScreen.routeName: (_) => ForgetpasswordScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
