import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/lovelace_Logo.png'),
        title: Text('Home', style: TextStyle(fontFamily: 'Bookman Old Style'),),
      ),
      body: Image.asset('assets/lovelace_Logo.png'),
    );
  }
}