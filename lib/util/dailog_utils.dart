
import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            Text("Loading...."),
            Spacer(),
            CircularProgressIndicator(),
          ],
        ),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

Future<void> showMessage({
  String? title,
  String? posActionText,
  String? negActionText,
  Function? onPosActionClick,
  Function? onNegActionClick,
  required String message,
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: Text(message),
        actions: [
          if (posActionText != null)
            TextButton(
              onPressed: () {
                onPosActionClick?.call();
                Navigator.pop(context);
              },
              child: Text(posActionText),
            ),
          if (negActionText != null)
            TextButton(
              onPressed: () {
                onNegActionClick?.call();
                Navigator.pop(context);
              },
              child: Text(negActionText),
            ),
        ],
      );
    },
  );
}
