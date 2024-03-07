import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //------------------
          // Background image
          //------------------

          //------------------
          // Logo image
          //------------------
          Center(
            child: Image.asset('assets/lovelace_Logo.png'),
            
          ),
          //------------------
          // Login buttons
          //------------------
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: (){}, 
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                    ),
                  )),
                  ElevatedButton(
                  onPressed: (){}, 
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                    ),
                  ))
              ],
            ))
        ],
      )
    );
  }
}