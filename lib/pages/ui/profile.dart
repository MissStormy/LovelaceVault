import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: actualTheme.colorScheme.secondary, 
         leading: Image.asset('assets/logoIn.png'),
        title: Text('Profile', style: TextStyle(fontFamily: 'Bookman Old Style'),),
        
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