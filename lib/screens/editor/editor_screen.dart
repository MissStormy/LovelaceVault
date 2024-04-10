import 'package:flutter/material.dart';
import 'package:lovelacevault/widgets/ui/custom_appbar.dart';


class EditorScreen extends StatefulWidget {
  const EditorScreen({Key? key}) : super(key: key);

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: const CustomRoundedAppBar(),
      body: Column(
        children: [
          // Calendario de scroll horizontal
          Container(
            
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Espacio para varios recursos (a rellenar)
                  SizedBox(height: 20),
                  Placeholder(), // Placeholder para recursos
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acción al presionar el botón flotante +
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

