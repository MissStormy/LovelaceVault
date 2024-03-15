import 'package:flutter/material.dart';
import 'package:lovelacevault/models/resource.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/textEditor/editorToolbar.dart';
import 'package:provider/provider.dart';


class Editor extends StatefulWidget {
  final VoidCallback goBack;
  final VoidCallback showPopUp;
  const Editor({super.key, required this.goBack, required this.showPopUp});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
 late TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => widget.goBack(),
        ),
        title: Text('Tesis 1')),
      body: Column(
      children: [
        EditorToolbar(
          onBoldPressed: () {
            // Implement bold functionality
            print('Bold pressed');
          },
          onItalicPressed: () {
            // Implement italic functionality
            print('Italic pressed');
          },
          onUnderlinePressed: () {
            // Implement underline functionality
            print('Underline pressed');
          },
          onAddCitationPressed: () => widget.showPopUp(),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],)
    );
  }

   
}
