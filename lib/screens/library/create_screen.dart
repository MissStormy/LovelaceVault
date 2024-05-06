import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late String defaultValue;
  
  @override
  void initState() {
    super.initState();
    defaultValue = 'Libro';
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    final List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(value: 'Libro', child: Text('Libro')),
      DropdownMenuItem(value: 'Tesis', child: Text('Tesis')),
      DropdownMenuItem(value: 'Recurso', child: Text('Recurso')),
      DropdownMenuItem(value: 'Otro', child: Text('Otro')),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
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
                    decoration: InputDecoration(labelText: 'Fecha de edición'),
                  ),
                ),
                SizedBox(width: 16.0),
                DropdownButton<String>(
                  value: defaultValue, 
                  items: items,
                  iconEnabledColor: actualTheme.colorScheme.onError, 
                  style: TextStyle(color: actualTheme.colorScheme.onError),
                  onChanged: (String? value) {
                    setState(() {
                      defaultValue = value!; // Actualiza el valor por defecto con el valor seleccionado
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Descripción'),
              maxLines: 3,
            ),
            SizedBox(height: 32.0),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
            )
          ],
        ),
      ),
    );
  }
}
