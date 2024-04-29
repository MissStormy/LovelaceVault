import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: 'Libro', child: Text('Libro')),
    DropdownMenuItem(value: 'Tesis', child: Text('Tesis')),
    DropdownMenuItem(value: 'Recurso', child: Text('Recurso')),
    DropdownMenuItem(value: 'Otro', child: Text('Otro')),
  ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Título'),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Autor'),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Fecha'),
                  ),
                ),
                SizedBox(width: 16.0),
                DropdownButton<String>(
                  items: items,
                  onChanged: (String? value) {},
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            SizedBox(height: 32.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('Crear'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.close),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
