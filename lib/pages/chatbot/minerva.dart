import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class Minerva extends StatefulWidget {
  const Minerva({Key? key}) : super(key: key);

  @override
  _MinervaState createState() => _MinervaState();
}

class _MinervaState extends State<Minerva> {
  final TextEditingController _textController = TextEditingController();
  List<Map<String, String>> chatHistory = [];

 late Map<String, String> chatResponses = {
  'hola': 'Hola',
  'como estas':
      'Soy solo un chatbot, pero estoy bien. ¿En qué puedo ayudarte?',
  'ayuda':
      'Por supuesto, puedo ayudarte con información sobre bibliografias, citas, etc.',
  'quien eres':
      'Minerva, tu ayuda para la creación de bibliografías y citas.',
  'apa 7': 'El formato de cita APA 7 sigue las pautas de la Asociación Psicológica Americana, 7ª edición. Incluye el autor(es), la fecha de publicación, el título y la información de la fuente para citar diversos tipos de fuentes.',
  'iso 690': 'El formato de cita ISO 690 es un estándar internacional para la referenciación bibliográfica. Proporciona pautas para citar diferentes tipos de documentos, incluidos libros, artículos de revistas y recursos en línea.',
  'mla': 'El formato de cita MLA se usa comúnmente en humanidades, particularmente en estudios de literatura y lenguaje. Enfatiza la cita autor-página en el texto y una lista de obras citadas al final del documento.',
  'chicago': 'El formato de cita de Chicago ofrece dos estilos: Notas-Bibliografía y Autor-Fecha. El estilo de Notas-Bibliografía utiliza notas al pie o al final y una bibliografía, mientras que el estilo de Autor-Fecha utiliza citas parentéticas en el texto y una lista de referencias.',
  'harvard': 'El formato de cita de Harvard es un estilo genérico de autor-fecha utilizado en varias disciplinas. Requiere citas en el texto que contengan el apellido del autor y el año de publicación, junto con una lista de referencias correspondiente al final del documento.',
  'ieee': 'El formato de cita IEEE se usa comúnmente en disciplinas de ingeniería e informática. Utiliza citas numéricas entre corchetes, que hacen referencia a entradas en una lista numerada de referencias al final del documento.',
  'vancouver': 'El formato de cita de Vancouver se utiliza principalmente en campos biomédicos y científicos. Utiliza citas numéricas sobrescritas en el texto, que corresponden a una lista numerada de referencias al final del documento.',
  // Agrega más formatos de citas bibliográficas y sus descripciones aquí
};



  void _handleSubmitted(String text) {
    _textController.clear();

    // Process user input
    String response = processUserInput(text);

    // Update chat history
    setState(() {
      chatHistory.add({'user': text});
      chatHistory.add({'minerva': response});
    });
  }

  String processUserInput(String userInput) {
  // Limpiar la entrada del usuario para eliminar espacios y caracteres especiales
  String cleanedInput = userInput.toLowerCase().trim();

  // Buscar palabras clave en el mapa chatResponses
  for (String key in chatResponses.keys) {
    if (cleanedInput.contains(key)) {
      return chatResponses[key] ??
          'No tengo información sobre ${key.toUpperCase()} en este momento.';
    }
  }

  // Si no se encuentra ninguna palabra clave, devolver un mensaje predeterminado
  return 'Lo siento, no puedo ayudarte con esa consulta en este momento.';
}



  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      backgroundColor: actualTheme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false, // To remove the back arrow
        title: const Center(
          child: Text('Minerva'),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chatHistory.length,
                  itemBuilder: (context, index) {
                    Map<String, String> message = chatHistory[index];
                    return Align(
                      alignment: message.containsKey('user')
                          ? Alignment.topRight // Align user's message to the right
                          : Alignment.topLeft, // Align Minerva's message to the left
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: message.containsKey('user')
                              ? actualTheme.colorScheme.background // User
                              : actualTheme.colorScheme.secondary, // Minerva
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          message.values.first,
                          style: TextStyle(
                            color: message.containsKey('user')
                                ? Colors.black // Text color for user messages
                                : Colors.white, // Text color for Minerva's messages
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(height: 1.0),
              Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).cardColor),
                child: _buildTextComposer(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: const IconThemeData(color: Colors.green),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}
