import 'package:flutter/material.dart';
import 'package:movies_app/common%20_widget/filled_button.dart';
import 'package:movies_app/screens_ui/login_screen/login_screen.dart';
import 'package:movies_app/util/app_colors.dart';

import '../../common _widget/custometextfilled.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text(
              "Register",
              style: TextStyle(
                  color: AppColors.yellow,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        leading: Icon(
          Icons.arrow_back_rounded,
          color: AppColors.yellow,
          size: 30,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          CustomTextField(
            hintText: "Name",
            preIcon: Icons.perm_identity_rounded,
          ),
          CustomTextField(
            hintText: "Email",
            preIcon: Icons.mail,
          ),
          CustomTextField(
            hintText: "Password",
            preIcon: Icons.lock_rounded,
            sufIcon: Icons.remove_red_eye_rounded,
          ),
          CustomTextField(
            hintText: "Confirm Password",
            preIcon: Icons.lock_rounded,
            sufIcon: Icons.remove_red_eye_rounded,
          ),
          CustomTextField(
            hintText: "Phone Number",
            preIcon: Icons.phone,
          ),
          CustomeFilledButton(
              text: "Create Account",
              textFontSize: 20,
              textColor: AppColors.black,
              backgroundColor: WidgetStatePropertyAll(AppColors.yellow)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have Account ?",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
