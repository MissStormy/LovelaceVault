import 'package:flutter/material.dart';
import 'package:lovelacevault/data/usuario.dart';
import 'package:lovelacevault/nexus.dart';
import 'package:lovelacevault/widgets/buttons/custom_login_button.dart';
import 'package:lovelacevault/widgets/textfield/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/loginBG.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white
                    .withOpacity(0.0), // Transparente en la parte superior
                Colors.white
                    .withOpacity(0.5), // Opacidad máxima en la parte inferior
              ],
            ),
          ),
          alignment: Alignment.center, // Centra la imagen en el contenedor
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .end, // Posiciona los elementos al final del espacio disponible
            crossAxisAlignment: CrossAxisAlignment
                .center, // Alinea los elementos al centro horizontalmente

            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50), // Espacio adicional en la parte inferior
                child: Container(
                  height: 100, // Altura de la imagen
                  width: 100, // Ancho de la imagen
                  child: Image.asset(
                    'assets/lovelace_Logo.png', // Ruta de la imagen
                    fit: BoxFit.contain, // Ajuste de la imagen
                  ),
                ),
              ),
              CustomTextField(
                  controller: _usernameController, hintText: 'Username'),
              CustomTextField(
                  controller: _passwordController, hintText: 'Password'),
              CustomLoginButton(text: 'Sign in', onPressed: () async{
               String username = _usernameController.text;
                String password = _passwordController.text;
                
                // Obtiene la lista de usuarios de la base de datos
                List<Usuario> usuarios = await Usuario().getUsuarios();
                
                // Busca si existe un usuario con las credenciales proporcionadas
                Usuario? usuarioValido;
                for (var usuario in usuarios) {
                  if (usuario.username == username && usuario.password == password) {
                    usuarioValido = usuario;
                    break;
                  }
                }

                if (usuarioValido != null) {
                  // Si se encontró un usuario con las credenciales, navega a la pantalla Nexus
                  _navigateToNexusPage(context, usuarioValido);
                } else {
                  // Si no se encontró un usuario con las credenciales, muestra un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Invalid username or password. Please try again.'),
                    duration: Duration(seconds: 3),
                    
                  ));
                }
              }),
              SizedBox(height: 5.0),
              const Text(
                "Don't have an account yet?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Acción al presionar el enlace "Sign up"
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToNexusPage(BuildContext context, Usuario usuario) {
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
