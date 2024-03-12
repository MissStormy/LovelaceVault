import 'package:flutter/material.dart';

class Bookshelf extends StatefulWidget {
  const Bookshelf({super.key});

  @override
  State<Bookshelf> createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: Image.asset('assets/lovelace_Logo.png'),
        title: Text('Bookshelf', style: TextStyle(fontFamily: 'Bookman Old Style'),),
      
      ),
      body: SingleChildScrollView(
        child: Column(
          //-----------
          // SEARCH BAR
          //-----------

          //------------
          // COLLECTIONS
          //------------

          //--------------------
          // LIST OF SAVED WORKS
          //--------------------
        ),
      ),
    );
  }
}