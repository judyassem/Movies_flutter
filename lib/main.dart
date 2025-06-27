import 'package:flutter/material.dart';
import 'package:movies_app/screens_ui/auth/forget_password/forgetpassword_screen.dart';
import 'package:movies_app/screens_ui/auth/login_screen/login_screen.dart';
import 'package:movies_app/screens_ui/auth/register_screen/register.dart';
import 'package:movies_app/screens_ui/home_screen/home_screen.dart';
import 'package:movies_app/screens_ui/movie_details/movie_details.dart';
// import 'package:movies_app/screens_ui/on_boarding/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        //OnBoarding.routeName: (_) => OnBoarding(),
        LoginScreen.routeName: (_) => LoginScreen(),
        ForgetpasswordScreen.routeName: (_) => ForgetpasswordScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        MovieDetails.routeName: (_) => MovieDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
