import 'package:flutter/material.dart';
import 'package:lovelacevault/pages/login/login.dart';

//
//   =================
//   ||             ||    Autor: Lara Rodriguez
//   ||   </Miss    ||    Alias: Miss Stormy 
//   ||   Stormy>   ||    App: MedGuardian
//   ||             ||    Web: missstormy.neocities.org
//   =================
//   //_____________\\
//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    //Load the actual theme
    //final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: actualTheme, 
    home: const LoginPage());
  }
}