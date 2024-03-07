import 'package:flutter/material.dart';
import 'package:lovelacevault/nexus.dart';

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
        Image.asset(
          'assets/fondo_login_light.jpg',
          fit: BoxFit.fill,
        ),
        //-----------------
        // App Title
        //-----------------
        const Positioned(
            top: 100,
            left: 85,
            child: Column(
              children: [
                Text(
                  'LovelaceVault',
                  style: TextStyle(
                    fontFamily: 'Bookman Old Style',
                    fontSize: 30
                  ),)],
            )),
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
          left: 0,
          bottom: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: 250, height: 50), // Adjust width as needed
                child: ElevatedButton(
                  onPressed: () {
                  _navigateToNexusPage(context);
                },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 20.0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            0), // Adjust border radius as needed
                        bottomRight: Radius.circular(
                            0), // Adjust border radius as needed
                        topLeft: Radius.circular(
                            5.0), // Adjust border radius as needed
                        bottomLeft: Radius.circular(
                            5.0), // Adjust border radius as needed
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Bookman Old Style',
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                    width: 300, height: 50), // Adjust width as needed
                child: ElevatedButton(
                  onPressed: () {
                  _navigateToNexusPage(context);
                },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 20.0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    )),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Bookman Old Style',
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

void _navigateToNexusPage(BuildContext context) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Nexus(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}
