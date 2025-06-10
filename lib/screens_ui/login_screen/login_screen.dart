import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common%20_widget/custometextfilled.dart';
import 'package:movies_app/common%20_widget/filled_button.dart';
import 'package:movies_app/screens_ui/forget_password/forgetpassword_screen.dart';
import 'package:movies_app/screens_ui/register_screen/register.dart';
import 'package:movies_app/util/app_colors.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Image.asset("assets/316662-P9J1RJ-122 1.png"),
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
          Row(
            children: [
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, ForgetpasswordScreen.routeName);
                  },
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
          CustomeFilledButton(
            backgroundColor: WidgetStatePropertyAll(AppColors.yellow),
            text: "Login",
            textColor: AppColors.black,
            textFontSize: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t Have Account ?",
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RegisterScreen.routeName);
                },
                child: Text(
                  "Create One ",
                  style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  color: AppColors.yellow,
                  thickness: 1.5,
                  height: 1.5,
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("OR",
                      style: TextStyle(
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                Expanded(
                    child: Divider(
                  color: AppColors.yellow,
                  thickness: 1.5,
                  height: 1.5,
                ))
              ],
            ),
          ),
          CustomeFilledButton(
            backgroundColor: WidgetStatePropertyAll(AppColors.yellow),
            icon: Icons.g_mobiledata_rounded,
            text: "Login With Google",
            textColor: AppColors.black,
            textFontSize: 16,
          ),
        ],
      ),
    );
  }
}
