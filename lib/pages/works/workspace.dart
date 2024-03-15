import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class Workspace extends StatefulWidget {
  final VoidCallback addWork;
  const Workspace({super.key, required this.addWork});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: actualTheme.colorScheme.secondary, 
         leading: Image.asset('assets/logoIn.png'),
        title: Text('Workspace', style: TextStyle(fontFamily: 'Bookman Old Style'),),
      
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),
          //-----------
          // SEARCH BAR
          //-----------
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchBar()
          ),
          //------------
          // COLLECTIONS
          //------------
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

          )
          //--------------------
          // LIST OF SAVED WORKS
          //--------------------
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.addWork(),
        child: Icon(Icons.add),
      ),
    );
  }
}