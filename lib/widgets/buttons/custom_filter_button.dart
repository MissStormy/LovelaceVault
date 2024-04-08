import 'package:flutter/material.dart';

class CustomFilterButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const CustomFilterButton({
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0), 
          boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Color de la sombra
                      spreadRadius: 2, // Extensión de la sombra
                      blurRadius: 5, // Difuminado de la sombra
                      offset:
                          Offset(0, 3), // Desplazamiento de la sombra en x y y
                    ),
                  ],
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0, // Reduce el tamaño del texto
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
