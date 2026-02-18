import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(content)));
}

void showErrorSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(content), backgroundColor: Colors.red),
    );
}

void showFlushBar({
  required BuildContext context,
  required String message,
  bool isError = true,
}) {
  if (!context.mounted) return;
  Flushbar(
    message: message,
    backgroundColor: isError ? Colors.red : Colors.green,
    duration: Duration(seconds: 3),
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(12),
    flushbarPosition: FlushbarPosition.TOP,
    animationDuration: Duration(milliseconds: 300),
    shouldIconPulse: false,
    icon: Icon(
      isError ? Icons.error_outline : Icons.check_circle_outline,
      color: Colors.white,
      size: 26,
    ),
  ).show(context);
}
