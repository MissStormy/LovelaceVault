import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/editor_screen.dart';
import 'package:lovelacevault/screens/home_screen.dart';
import 'package:lovelacevault/screens/library_screen.dart';
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },));
  }
}