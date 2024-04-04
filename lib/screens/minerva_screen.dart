import 'package:flutter/material.dart';

class Minerva extends StatefulWidget {
  const Minerva({super.key});

  @override
  State<Minerva> createState() => _MinervaState();
}

class _MinervaState extends State<Minerva> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0), // Esquina inferior derecha redondeada
          ),
        ),
        backgroundColor: Colors.transparent, // Hace que el AppBar sea transparente
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200, 
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), 
            bottomLeft: Radius.circular(40.0)
          ),
        ),
        child: Center(
          child: Text(
            'Contenido de la pantalla de inicio',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}