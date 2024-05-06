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
    _selectedIndex = 1;
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
            margin: EdgeInsets.only(left: isDrawerOpen ? 60.0 : 0.0),
            decoration: BoxDecoration(
              //color: actualTheme.colorScheme.background,
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
              //color: actualTheme.colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  ListTile(
                    tileColor: _selectedIndex == 0 ? actualTheme.colorScheme.background : null,
                    title: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Colecciones', style: TextStyle(color: actualTheme.colorScheme.onError),),
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
                    tileColor: _selectedIndex == 1 ? actualTheme.colorScheme.background : null,
                    title: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Lista', style: TextStyle(color: actualTheme.colorScheme.onError)),
                    ),
                    onTap: () {
                      setState(() {
                        selectedOption = 'Lista';
                        isDrawerOpen = false;
                        _selectedIndex = 1; 
                      });
                    },
                  ),
                  SizedBox(height: 50,),
                  ListTile(
                    tileColor: _selectedIndex == 2 ? actualTheme.colorScheme.background : null,
                    title: RotatedBox(
                      quarterTurns: 3,
                      child: Text('Crear', style: TextStyle(color: actualTheme.colorScheme.onError)),
                    ),
                    onTap: () {
                      setState(() {
                        selectedOption = 'Crear';
                        isDrawerOpen = false;
                        _selectedIndex = 2; 
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
