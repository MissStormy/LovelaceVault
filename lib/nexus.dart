import 'package:flutter/material.dart';
import 'package:lovelacevault/pages/home/home.dart';

class Nexus extends StatefulWidget {
  const Nexus({super.key});

  @override
  State<Nexus> createState() => _NexusState();
}

class _NexusState extends State<Nexus> {
  //-------------------
  // Variables
  //-------------------
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //-----------------
    // Screen Navigator
    //-----------------
    final List<Widget> screens = [
      Home()
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: AppBar(
        //leading: Image.asset('assets/lovelace_Logo.png'),
      //),
      body: screens[
          _selectedIndex],
      bottomNavigationBar: Placeholder(),
    );
  }
}