import 'package:flutter/material.dart';
import 'package:lovelacevault/data/datamanager.dart';
import 'package:lovelacevault/data/documento.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class WordScreen extends StatefulWidget {
  final String fileName;
  const WordScreen({Key? key, required this.fileName}) : super(key: key);

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  String _selectedFormat = 'Normal';
  String _selectedFont = 'Arial';
  double _selectedFontSize = 12.0;
  TextEditingController _textEditingController = TextEditingController();
  bool _readOnly = true;
  TextAlign _alignment = TextAlign.left;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    String fileName = widget.fileName;
    return Scaffold(
      appBar: AppBar(
        title: Text(fileName),
        actions: [
          IconButton(
            icon: Icon(Icons.undo),
            onPressed: () {
              // Implementa la lógica para deshacer
            },
          ),
          IconButton(
            icon: Icon(Icons.redo),
            onPressed: () {
              // Implementa la lógica para rehacer
            },
          ),
          IconButton(
            icon: Icon(Icons.format_color_text),
            onPressed: () {
              _showFormatOptions(context);
            },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: ListTile(
                    
                    title: Text('Más opciones'),
                    onTap: () {
                      
                    },
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          // Cuando se toca la pantalla, oculta el teclado
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              child: TextField(
                controller: _textEditingController,
                enabled:
                    !_readOnly, 
                maxLines: null, 
                textAlign: _alignment,
                style: TextStyle(color: actualTheme.colorScheme.onError),
                decoration: InputDecoration(
                  hintText: 'Escribe aquí...',
                  border: InputBorder.none, 
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.format_bold),
              onPressed: () {
                // Implementa la lógica para cambiar a negrita
              },
            ),
            IconButton(
              icon: Icon(Icons.format_italic),
              onPressed: () {
                // Implementa la lógica para cambiar a cursiva
              },
            ),
            IconButton(
              icon: Icon(Icons.format_underline),
              onPressed: () {
                // Implementa la lógica para subrayar
              },
            ),
            PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.format_align_left),
                      title: Text('Alinear a la izquierda'),
                      onTap: () {
                        setState(() {
                          _alignment = TextAlign.left;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.format_align_center),
                      title: Text('Alinear al centro'),
                      onTap: () {
                        setState(() {
                          _alignment = TextAlign.center;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      leading: Icon(Icons.format_align_right),
                      title: Text('Alinear a la derecha'),
                      onTap: () {
                        setState(() {
                          _alignment = TextAlign.right;
                        });
                      },
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Cambia el estado de solo lectura al contrario
            _readOnly = !_readOnly;

            // Guarda los datos cuando se cambia de modo de edición a modo de lectura
            if (!_readOnly) {
              _saveDocumentData(); // Llama a la función para guardar los datos
            }
          });
        },
        child: Icon(_readOnly ? Icons.edit : Icons.done),
      ),
    );
  }

// Función para guardar los datos del documento en formato JSON
  void _saveDocumentData() async {
    try {
      final document = Document(
        nombre: widget.fileName,
        contenido: _textEditingController.text,
        formato: _selectedFormat,
        fuente: _selectedFont,
        tamanyoFuente: _selectedFontSize,
      );

      // Carga los documentos existentes
      final List<Document> documents = await DataManager.loadDocuments();

      // Busca el documento actual por nombre y actualiza sus datos si existe
      final index =
          documents.indexWhere((doc) => doc.nombre == document.nombre);
      if (index != -1) {
        documents[index] = document;
      } else {
        // Si el documento no existe, agrégalo a la lista
        documents.add(document);
      }

      // Guarda la lista actualizada de documentos
      await DataManager.saveDocuments(documents);
    } catch (e) {
      print('Error al guardar los datos del documento: $e');
    }
  }

    void _showFormatOptions(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Opciones de formato',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: 'Normal',
                  items: ['Negrita', 'Cursiva', 'Subrayado', 'Normal']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // Implementa la lógica para cambiar el formato
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: 'Arial',
                  items: ['Arial', 'Verdana', 'Times New Roman', 'Calibri']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // Implementa la lógica para cambiar la fuente
                  },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<double>(
                  value: 12.0,
                  items: [10.0, 12.0, 14.0, 16.0, 18.0].map((double value) {
                    return DropdownMenuItem<double>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (double? value) {
                    // Implementa la lógica para cambiar el tamaño de la fuente
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

