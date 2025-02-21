import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: const Color.fromARGB(31, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.search, size: 30),
      ),
    );
  }
}
