import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/editor_screen.dart';
import 'package:lovelacevault/screens/home_screen.dart';
import 'package:lovelacevault/screens/library_screen.dart';
import 'package:lovelacevault/screens/minerva_screen.dart';
import 'package:lovelacevault/screens/profile_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

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
  late TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    //-----------------
    // Screen Navigator
    //-----------------
    final List<Widget> screens = [
      //-----
      //  0
      //-----
      HomeScreen(),
      EditorScreen(),
      BookshelfScreen(),
      Minerva(),
      ProfileScreen()
    ];

    return Scaffold(
      /* appBar: AppBar(
        automaticallyImplyLeading: false,
      ), */
      body: screens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), // Esquina superior izquierda redondeada
          topRight: Radius.circular(20.0), // Esquina superior derecha redondeada
        ),
        child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/logoIn.png', width: 24, height: 24,),
            label: 'Editor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Colors.white),
            label: 'Bookshelf',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/minerva2.png', width: 24, height: 24),
            label: 'Minerva',
          ),
        ],
      ),
    ));
  }
}