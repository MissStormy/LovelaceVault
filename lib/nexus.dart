import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/editor/editor_screen.dart';
import 'package:lovelacevault/screens/home_screen.dart';
import 'package:lovelacevault/screens/library/library_screen.dart';
import 'package:lovelacevault/screens/minerva_screen.dart';
import 'package:lovelacevault/screens/profile_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/ui/custom_navigation_bar.dart';
import 'package:provider/provider.dart';

class Nexus extends StatefulWidget {
  const Nexus({super.key});

  @override
  State<Nexus> createState() => _NexusState();
}

class _NexusState extends State<Nexus> {
  // VARIABLES
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    // SCREEN NAVIGATOR
    final List<Widget> screens = [
      //  INDEX 0
      HomeScreen(),
      //  INDEX 1
      EditorScreen(
        fileName: '',
      ),
      //  INDEX 2
      BookshelfScreen(),
      //  INDEX 3
      Minerva(),
      //  INDEX 4
      ProfileScreen()
    ];

    return Scaffold(
      backgroundColor: Colors.transparent, // Establece el fondo del Scaffold como transparente
      body: Stack(
        children: [
          Positioned.fill(
            child: screens[_selectedIndex],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomBottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
