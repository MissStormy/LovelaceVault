import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.jpg'),
          fit: BoxFit.cover,
        ), 
         leading: Image.asset('assets/lovelace_Logo.png'),
        title: Text('Profile', style: TextStyle(fontFamily: 'Bookman Old Style'),),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),
          //-----------
          // IMAGE
          //-----------
          
          //------------
          // INFO
          //------------
          
          //--------------------
          // FRIENDS????
          //--------------------
          ]
        ),
      ),
    );
  }
}