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
          color: Colors.orangeAccent.withOpacity(0.8), // Color naranja más intenso
          width: 2.0, // Ancho del borde
        ),
        color: Colors.white.withOpacity(0.9), // Fondo blanco con menos opacidad
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
                color: Colors.transparent, // Transparente para que coincida con el color de fondo
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orangeAccent.withOpacity(0.2), // Color naranja más intenso
                width: 2.0, // Ancho del borde
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            filled: true, // Establecer el TextField como lleno
            fillColor: Colors.white.withOpacity(0.2), // Fondo blanco con menos opacidad
          ),
        ),
      ),
    );
  }
}
