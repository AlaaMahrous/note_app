import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
  });
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(color: Colors.black, fontSize: 20)),
              isLoading
                  ? Transform.scale(
                    scale: 0.5,
                    child: CircularProgressIndicator(strokeWidth: 4.5),
                  )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
