import 'package:flutter/material.dart';
import 'package:movies_app/util/app_colors.dart';
import 'package:movies_app/util/textStyles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData preIcon;
  final IconData? sufIcon;
  final TextEditingController? controller;

  const CustomTextField(
      {super.key, required this.hintText, required this.preIcon, this.sufIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.justify,
          style: TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.black,
                  width: 1,
                )),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.black,
                  width: 1,
                )),
            fillColor: AppColors.grayishBlack,
            hintText: hintText,
            hintStyle: AppStyles.hintTextFormField,
            prefixIcon: Icon(
              preIcon,
              size: 30,
              color: AppColors.white,
            ),
            suffixIcon: sufIcon != null
                ? Icon(sufIcon, size: 30, color: AppColors.white)
                : null,
          ),
        ),
      ),
    );
  }
}
