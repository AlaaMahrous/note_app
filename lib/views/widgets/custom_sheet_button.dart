import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        width: MediaQuery.of(context).size.width,
        height: 48,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
