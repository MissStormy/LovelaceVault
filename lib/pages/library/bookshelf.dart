import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class Bookshelf extends StatefulWidget {
  const Bookshelf({super.key});

  @override
  State<Bookshelf> createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {
  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.jpg'),
          fit: BoxFit.cover,
        ), 
         leading: Image.asset('assets/lovelace_Logo.png'),
        title: Text('Bookshelf', style: TextStyle(fontFamily: 'Bookman Old Style'),),
      
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
    );
  }
}