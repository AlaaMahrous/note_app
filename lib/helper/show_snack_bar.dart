import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
}
