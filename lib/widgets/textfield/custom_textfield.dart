import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustomTextField({
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.orangeAccent.withOpacity(0.8), 
          width: 2.0, // Ancho del borde
        ),
        color: Colors.white.withOpacity(0.9), 
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent, 
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orangeAccent.withOpacity(0.2), 
                width: 2.0, // Ancho del borde
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true, 
            fillColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
