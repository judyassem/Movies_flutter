import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies_app/common%20_widget/filled_button.dart';
import 'package:movies_app/screens_ui/login_screen/login_screen.dart';
import 'package:movies_app/util/app_colors.dart';
import 'package:movies_app/util/dailog_utils.dart';

import '../../api_manager/api_manager.dart';
import '../../common _widget/custometextfilled.dart';
import '../../models/user_dm.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "RegisterScreen";


  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        buildNameTextField(),
        buildEmailTextField(),
        buildPassTextField(),
        buildRePassTextField(),
        buildPhoneTextField(),
        buildCreateAccountButton(),
        buildLoginRow(context)
      ],
    );
  }

  Row buildLoginRow(BuildContext context) {
    return Row(
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
      );
  }

  CustomeFilledButton buildCreateAccountButton() {
    return CustomeFilledButton(
      onClick: () async {
        try {
          final name = nameController.text.trim();
          final email = emailController.text.trim();
          final password = passwordController.text.trim();
          final rePassword = rePasswordController.text.trim();
          final phone = phoneController.text.trim();

          // Local validation
          if (name.isEmpty || email.isEmpty || password.isEmpty || phone.isEmpty || rePassword.isEmpty) {
            showMessage(
              message: "Please fill in all fields",
              context: context,
              negActionText: "Go Back",
            );
            return;
          }

          if (password != rePassword) {
            showMessage(
              message: "Passwords do not match",
              context: context,
              negActionText: "Retry",
            );
            return;
          }

          showLoading(context);

          final user = UserDm(
            name: name,
            email: email,
            password: password,
            confirmPassword: rePassword, // Ensure this maps to `confirmPassword` in JSON
            phone: phone,
            avaterId: 1, // Ensure this matches the backend's expected type
          );

          print("📤 Sending user: ${jsonEncode(user.toJson())}");

          final response = await ApiManager().registerUser(user);

          hideLoading(context);

          // Handle success or error from backend
          if (response != null) {
            if (response.message != null) {
               await showMessage(
                message: response.message!,
                context: context,
                posActionText: "Login",
              );
               Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            } else {
              showMessage(
                message: response.message!,
                context: context,
                negActionText: "Try Again",
              );
            }
          } else {
            showMessage(message: "Registration failed", context: context);
          }
        } catch (e, stack) {
          hideLoading(context);
          print("❌ Registration error: $e");
          print("🧱 Stack trace: $stack");
          showMessage(message: "An unexpected error occurred", context: context);
        }
      },
      text: "Create Account",
      textFontSize: 20,
      textColor: AppColors.black,
      backgroundColor: WidgetStatePropertyAll(AppColors.yellow),
    );
  }


  CustomTextField buildPhoneTextField() {
    return CustomTextField(
        hintText: "Phone Number",
        controller: phoneController,
        preIcon: Icons.phone,
      );
  }

  CustomTextField buildRePassTextField() {
    return CustomTextField(
        hintText: "Confirm Password",
        controller: rePasswordController,
        preIcon: Icons.lock_rounded,
        sufIcon: Icons.remove_red_eye_rounded,
      );
  }

  CustomTextField buildPassTextField() {
    return CustomTextField(
        hintText: "Password",
        controller: passwordController,
        preIcon: Icons.lock_rounded,
        sufIcon: Icons.remove_red_eye_rounded,
      );
  }

  CustomTextField buildEmailTextField() {
    return CustomTextField(
        hintText: "Email",
        controller: emailController,
        preIcon: Icons.mail,
      );
  }

  CustomTextField buildNameTextField() {
    return CustomTextField(
        hintText: "Name",
        controller: nameController,
        preIcon: Icons.perm_identity_rounded,
      );
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }
}
