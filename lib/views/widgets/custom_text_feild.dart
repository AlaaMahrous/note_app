import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hint,
    this.hight = 16,
    this.maxLines = 1,
  });
  final String hint;
  final double hight;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.blue),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: hight, horizontal: 13),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.blue),
      ),
    );
  }
}
