import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomLoginButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orangeAccent, 
          foregroundColor: Colors.white, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), 
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
