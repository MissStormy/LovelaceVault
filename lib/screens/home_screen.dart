import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Bienvenido, user',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: Image.asset('assets/profile.png'),
          ),
        ],

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight:
                Radius.circular(40.0), // Esquina inferior derecha redondeada
          ),
        ),
        backgroundColor:
            Colors.transparent, // Hace que el AppBar sea transparente
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0)),
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
