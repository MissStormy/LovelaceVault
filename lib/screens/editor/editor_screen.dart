import 'package:flutter/material.dart';
import 'package:lovelacevault/widgets/container/custom_work.dart';
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
          // TODO: CALENDARIO PARA LLEVAR EL CONTROL DE LOS TRABAJOS
          Container(
            
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  SizedBox(height: 20),
                  CustomWork(
                    name: 'Tesis del necronomicon', 
                    date: '12/03/12') 
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

