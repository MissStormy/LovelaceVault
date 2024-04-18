import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/library/collection_screen.dart';
import 'package:lovelacevault/screens/library/list_screen.dart';
import 'package:lovelacevault/screens/library/create_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/spacers/h_spacer_10.dart';
import 'package:provider/provider.dart';

class BookshelfScreen extends StatefulWidget {
  const BookshelfScreen({Key? key}) : super(key: key);

  @override
  _BookshelfScreenState createState() => _BookshelfScreenState();
}

class _BookshelfScreenState extends State<BookshelfScreen> {
  
  bool isDrawerOpen = false;
  String selectedOption = '';
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Establecer el primer elemento seleccionado por defecto
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final List<Widget> sections = [
      CollectionScreen(),
      ListScreen(),
      CreateScreen()
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Biblioteca'),
        backgroundColor: actualTheme.colorScheme.primary,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              isDrawerOpen = !isDrawerOpen;
            });
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: isDrawerOpen ? 50.0 : 0.0),
            decoration: BoxDecoration(
              color: actualTheme.colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              ),
            ),
            child: sections[_selectedIndex],
          ),
          if (isDrawerOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  isDrawerOpen = false;
                });
              },
            ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: isDrawerOpen ? 0.0 : -500.0,
            child: Container(
              width: 60.0,
              color: actualTheme.colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  ListTile(
                    tileColor: _selectedIndex == 0 ? actualTheme.colorScheme.background.withOpacity(0.5) : null,
                    title: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Colecciones'),
                    ),
                    onTap: () {
                      setState(() {
                        selectedOption = 'Colecciones';
                        isDrawerOpen = false;
                        _selectedIndex = 0; // Establecer el índice seleccionado
                      });
                    },
                  ),
                  SizedBox(height: 50,),
                  ListTile(
                    tileColor: _selectedIndex == 1 ? Colors.blue.withOpacity(0.2) : null,
                    title: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Lista'),
                    ),
                    onTap: () {
                      setState(() {
                        selectedOption = 'Lista';
                        isDrawerOpen = false;
                        _selectedIndex = 1; // Establecer el índice seleccionado
                      });
                    },
                  ),
                  SizedBox(height: 50,),
                  ListTile(
                    tileColor: _selectedIndex == 2 ? Colors.blue.withOpacity(0.2) : null,
                    title: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Crear'),
                    ),
                    onTap: () {
                      setState(() {
                        selectedOption = 'Crear';
                        isDrawerOpen = false;
                        _selectedIndex = 2; // Establecer el índice seleccionado
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
