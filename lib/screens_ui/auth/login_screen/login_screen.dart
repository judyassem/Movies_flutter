import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common%20_widget/custometextfilled.dart';
import 'package:movies_app/common%20_widget/filled_button.dart';
import 'package:movies_app/screens_ui/forget_password/forgetpassword_screen.dart';
import 'package:movies_app/screens_ui/homescreen.dart';
import 'package:movies_app/screens_ui/register_screen/register.dart';
import 'package:movies_app/util/app_colors.dart';

import '../../api_manager/api_manager.dart';
import '../../util/dailog_utils.dart';
import '../../util/token_utils.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(),
          buildImage(),
          buildEmailTextField(),
          buildPasswordTextField(),
          buildForgetPassword(context),
          buildLoginButton(context),
          buildRegisterRow(context),
          buildOrRow(),
          buildGoogleLoginButton(),
        ],
      ),
    );
  }

  CustomeFilledButton buildGoogleLoginButton() {
    return CustomeFilledButton(
          onClick: (){},
          backgroundColor: WidgetStatePropertyAll(AppColors.yellow),
          icon: Icons.g_mobiledata_rounded,
          text: "Login With Google",
          textColor: AppColors.black,
          textFontSize: 16,
        );
  }

  Padding buildOrRow() {
    return Padding(
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
        );
  }

  Row buildRegisterRow(BuildContext context) {
    return Row(
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
        );
  }

  Row buildForgetPassword(BuildContext context) {
    return Row(
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
        );
  }

  CustomeFilledButton buildLoginButton(BuildContext context) {
    return CustomeFilledButton(
          onClick: () async {
            try {
              showLoading(context);

              final email = emailController.text.trim();
              final password = passwordController.text;

              if (email.isEmpty || password.isEmpty) {
                hideLoading(context);
                showMessage(message: "Email and password must not be empty", context: context , negActionText: "Try again");
                return;
              }

              final response = await ApiManager().loginUser(email, password);

              hideLoading(context);

              if (response != null && response.data != null) {
                await saveToken(response.data!);
                await showMessage(message: response?.message ?? "success", context: context, posActionText: "continue");
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              } else {
                showMessage(
                  message: response?.message ?? "Login failed. Please try again.",
                  context: context,
                  negActionText: "Retry",
                );
              }
            } catch (e) {
              hideLoading(context);
              showMessage(message: "Login error: ${e.toString()}", context: context, negActionText: "Retry");
            }
          },
          backgroundColor: WidgetStatePropertyAll(AppColors.yellow),
          text: "Login",
          textColor: AppColors.black,
          textFontSize: 20,
        );
  }

  CustomTextField buildPasswordTextField() {
    return CustomTextField(
          controller: passwordController,
          hintText: "Password",
          preIcon: Icons.lock_rounded,
          sufIcon: Icons.remove_red_eye_rounded,
        );
  }

  CustomTextField buildEmailTextField() {
    return CustomTextField(
          controller: emailController,
          hintText: "Email",
          preIcon: Icons.mail,
        );
  }

  Padding buildImage() {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Image.asset("assets/316662-P9J1RJ-122 1.png"),
        );
  }
}
