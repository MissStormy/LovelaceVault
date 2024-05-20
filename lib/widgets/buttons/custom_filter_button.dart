import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomFilterButton extends StatefulWidget {
  final String text;
  
  final VoidCallback onTap;

  const CustomFilterButton({
    required this.text,
    
    required this.onTap,
  });

  @override
  _CustomFilterButtonState createState() => _CustomFilterButtonState();
}

class _CustomFilterButtonState extends State<CustomFilterButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected; 
        });
        widget.onTap(); 
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected ?  actualTheme.colorScheme.background : null , 
          borderRadius: BorderRadius.circular(20.0),
          
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          widget.text,
          style: TextStyle(
            color: actualTheme.colorScheme.onError,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
