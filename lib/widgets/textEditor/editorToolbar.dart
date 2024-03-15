import 'package:flutter/material.dart';

class EditorToolbar extends StatelessWidget {
  final void Function() onBoldPressed;
  final void Function() onItalicPressed;
  final void Function() onUnderlinePressed;
  final void Function() onAddCitationPressed;

  const EditorToolbar({
    Key? key,
    required this.onBoldPressed,
    required this.onItalicPressed,
    required this.onUnderlinePressed, required this.onAddCitationPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: onBoldPressed,
            icon: Icon(Icons.format_bold),
          ),
          IconButton(
            onPressed: onItalicPressed,
            icon: Icon(Icons.format_italic),
          ),
          IconButton(
            onPressed: onUnderlinePressed,
            icon: Icon(Icons.format_underline),
          ),
          IconButton(
            onPressed: onAddCitationPressed, 
            icon: Icon(Icons.add))
        ],
      ),
    );
  }
}