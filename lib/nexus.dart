import 'package:flutter/material.dart';
import 'package:lovelacevault/pages/home/home.dart';
import 'package:lovelacevault/pages/library/bookshelf.dart';
import 'package:lovelacevault/pages/library/work_detail.dart';
import 'package:lovelacevault/pages/ui/profile.dart';
import 'package:lovelacevault/pages/works/workspace.dart';

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
      //-----
      //  0
      //-----
      Home(showWork: () { 
        setState(() {
          _selectedIndex = 3;
        });
       }, showProfile: () {  
        setState(() {
          _selectedIndex = 4;
        });
       },),
      //-----
      //  1
      //-----
      Workspace(),
      //-----
      //  2
      //-----
      Bookshelf(),
      //-----
      //  3
      //-----
      WorkDetail(),
      //-----
      //  4
      //-----
      Profile()
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //-----------------------------------------------------
      // In this case, the AppBar will be done in each screen
      // to specify the buttons and title
      //-----------------------------------------------------
      body: screens[
          _selectedIndex],
      bottomNavigationBar: BottomAppBar(
        //color: actualTheme.colorScheme.secondary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        //shadowColor: actualTheme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              icon: const Icon(Icons.calendar_month),
              color: Colors.white,
            ),
            
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                icon: const Icon(Icons.list),
                color: Colors.white,
              ),
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Boom, here you have a bottomnavbar with the centered buttom!!
        onPressed: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
        //backgroundColor: actualTheme.colorScheme.onPrimary,
        elevation: 5,
        shape: const CircleBorder(),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
    );
  }
  //-------------------
  // SHORTCUT NAVIGATOR
  //-------------------
  void _navigateToScreen(String route) {
    Navigator.pushNamed(context, route);
  }
}