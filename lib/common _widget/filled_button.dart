import 'package:flutter/material.dart';
import 'package:movies_app/util/app_colors.dart';

class CustomeFilledButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double textFontSize;
  final Color textColor;
  final WidgetStateProperty<Color?>? backgroundColor;

  const CustomeFilledButton(
      {super.key,
      required this.text,
      this.icon,
      required this.textFontSize,
      required this.textColor,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
            backgroundColor: backgroundColor,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Icon(
                  icon,
                  color: AppColors.black,
                  size: 30,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: textFontSize,
                    fontWeight: FontWeight.w400),
              ),
            ],
          )),
    );
  }
}
