import 'package:flutter/material.dart';
import 'package:movies_app/common%20_widget/filled_button.dart';
import 'package:movies_app/util/app_colors.dart';

import '../../../common _widget/custometextfilled.dart';

class ForgetpasswordScreen extends StatelessWidget {
  static String routeName = "forget Password";

  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text(
              "Forget Password",
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
          const Row(),
          Image.asset("assets/forgetpassword.png"),
          CustomTextField(
            hintText: "Email",
            preIcon: Icons.mail,
          ),
          CustomeFilledButton(
            onClick: (){},
              text: "Verify Email",
              textFontSize: 20,
              textColor: AppColors.black,
              backgroundColor: WidgetStatePropertyAll(AppColors.yellow))
        ],
      ),
    );
  }
}
