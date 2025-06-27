import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double textFontSize;
  final Color textColor;
  final Color? iconColor;
  final WidgetStateProperty<Color?>? backgroundColor;
  final void Function() onClick;

  const CustomFilledButton(
      {super.key,
      required this.text,
      this.icon,
      required this.textFontSize,
      required this.textColor,
      required this.backgroundColor, required this.onClick, this.iconColor});

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
          onPressed: () {
            onClick();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Icon(
                  icon,
                  color: iconColor,
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
