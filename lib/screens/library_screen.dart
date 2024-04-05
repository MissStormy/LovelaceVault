import 'package:flutter/material.dart';
import 'package:lovelacevault/widgets/ui/custom_appbar.dart';

class BookshelfScreen extends StatefulWidget {
  const BookshelfScreen({super.key});

  @override
  State<BookshelfScreen> createState() => _BookshelfScreenState();
}

class _BookshelfScreenState extends State<BookshelfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomRoundedAppBar(
        
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200, 
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), 
            bottomLeft: Radius.circular(40.0)
          ),
        ),
        child: Center(
          child: Text(
            'Contenido de la pantalla de inicio',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}