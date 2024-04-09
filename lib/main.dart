import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/login/login_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';
//
//   =================
//   ||             ||    Autor: Lara Rodriguez
//   ||   </Miss    ||    Alias: Miss Stormy 
//   ||   Stormy>   ||    App: LovelaceVault
//   ||             ||    Web: missstormy.neocities.org
//   =================
//   //_____________\\
//
void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeLoader(0)),
      ],
      child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     //Load the actual theme
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: actualTheme, 
    home: const LoginPage());
  }
}

