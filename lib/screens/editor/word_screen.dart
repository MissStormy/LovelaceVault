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
              // TODO: LOGICA DESHACER
            },
          ),
          IconButton(
            icon: Icon(Icons.redo),
            onPressed: () {
              // TODO: LOGICA REHACER
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
          // OCULTA EL TECLADO
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
                // TODO: CAMBIAR A NEGRITA
              },
            ),
            IconButton(
              icon: Icon(Icons.format_italic),
              onPressed: () {
                // TODO: CAMBIAR A CURSIVA
              },
            ),
            IconButton(
              icon: Icon(Icons.format_underline),
              onPressed: () {
                // TODO: CAMBIAR A SUBRAYADO
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
            // CAMBIA EL ESTADO DE LECTURA A EDICION
            _readOnly = !_readOnly;

            // GUARDA DATOS AL PULSAR SOBRE EL BOTON EDICION
            if (!_readOnly) {
              _saveDocumentData(); 
            }
          });
        },
        child: Icon(_readOnly ? Icons.edit : Icons.done),
      ),
    );
  }

// FUNCION PARA GUARDAR LOS DATOS DEL DOCUMENTO EN FORMATO JSON TODO:
  void _saveDocumentData() async {
    try {
      final document = Document(
        nombre: widget.fileName,
        contenido: _textEditingController.text,
        formato: _selectedFormat,
        fuente: _selectedFont,
        tamanyoFuente: _selectedFontSize,
      );

      // CARGA LOS DOCUMENTOS YA EXISTENTES
      final List<Document> documents = await DataManager.loadDocuments();

      // BUSCA EL DOCUMENTO POR NOMBRE 
      final index =
          documents.indexWhere((doc) => doc.nombre == document.nombre);
      if (index != -1) {
        documents[index] = document;
      } else {
        // SI NO EXISTE, SE AGREGA
        documents.add(document);
      }

      // GUARDA LA LISTA ACTUAL
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
                   
                  },
                ),
              ],
            ),
          );
        },
      );
    }
  }

