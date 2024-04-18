import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lovelacevault/theme/theme.dart';
//EXPANSION: CONVERTIR A MINERVA EN UNA IA
class Minerva extends StatefulWidget {
  @override
  _MinervaState createState() => _MinervaState();
}

class _MinervaState extends State<Minerva> {
  // CARGA DE LISTA DE MENSAJES 
  List<Map<String, dynamic>> _messages = []; 
  // LISTA DE PREGUNTAS Y RESPUESTAS
  final List<Map<String, String>> _qaPairs = [
    {'question': 'Hola', 'answer': '¡Hola! ¿En qué puedo ayudarte?'},
    {
      'question': '¿Cómo estás?',
      'answer': 'Estoy bien, gracias por preguntar.'
    },
    {'question': 'Adiós', 'answer': '¡Hasta luego!'},
    {
      'question': '¿Qué es un catálogo bibliográfico?',
      'answer':
          'Un catálogo bibliográfico es una lista organizada de los materiales de una biblioteca u otro recurso de información, que puede incluir libros, revistas, películas, música y otros tipos de recursos.'
    },
    {
      'question': '¿Qué es la catalogación?',
      'answer':
          'La catalogación es el proceso de describir y organizar los materiales de una biblioteca de acuerdo con estándares y normas específicas, para facilitar su acceso y recuperación por parte de los usuarios.'
    },
    {
      'question': '¿Cuál es la diferencia entre una biblioteca y un archivo?',
      'answer':
          'Una biblioteca generalmente contiene una colección de materiales publicados, como libros, revistas y periódicos, destinados a su uso por el público en general. Un archivo, por otro lado, es un lugar donde se almacenan y preservan documentos históricos, registros gubernamentales, manuscritos y otros materiales únicos y raros.'
    },
    {
      'question': '¿Qué es un ISBN?',
      'answer':
          'El ISBN, o Número de Identificación de Libro Estándar Internacional, es un identificador único asignado a cada edición de un libro publicado. Facilita la identificación y el seguimiento de los libros en el mercado.'
    },
    {
      'question': '¿Qué es un archivo digital?',
      'answer':
          'Un archivo digital es una colección de documentos o registros almacenados en formato electrónico en medios de almacenamiento digital, como discos duros, servidores en la nube o dispositivos de memoria USB.'
    },
  ]; 
  // MENSAJES DE USUARIO
  // LEE EL MENSAJE, LO BUSCA ENTRE LAS PREGUNTAS Y RESPUESTAS, Y DEVUELVE UNA RESPUESTA
  void _handleUserMessage(String message) {
    setState(() {
      
      _messages.add({'message': message, 'isMinerva': false});

      // BUSCAR SI LA PREGUNTA DEL USUARIO COINCIDE CON ALGUNA PREGUNTA PREDEFINIDA
      final qaPair = _qaPairs.firstWhere(
        (pair) =>
            pair['question'] != null &&
            pair['question']!.toLowerCase().contains(message.toLowerCase()),
        orElse: () => {},
      );

      // SI SE ENCUENTRA UNA PREGUNTA COINCIDENTE, OBTIENE LA RESPUESTA Y LA PASA POR PANTALLA 
      if (qaPair != null) {
        _messages.add({'message': qaPair['answer'], 'isMinerva': true});
      } else {
        // Si no hay coincidencia, mostrar un mensaje predeterminado
        _messages.add({
          'message': 'Lo siento, no comprendo tu pregunta.',
          'isMinerva': true
        });
      }

      // LIMPIEZA DE TEXTFIELD
      _textController.clear();
    });
  }

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/minerva2.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Minerva',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Acción al presionar los tres puntos
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                // SACAMOS LOS DATOS DEL MAP DE MENSAJES
                children: _messages.map((messageData) {
                  return MessageBubble(
                    message: messageData['message'],
                    isMinerva: messageData['isMinerva'],
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    style: TextStyle(
                      color: actualTheme.colorScheme.onError
                    ),
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // CUANDO SE PULSA EL BOTON DE ENVIAR, SE GUARDA EL MENSAJE Y COMIENZA LA BUSQUEDA DE RESPUESTAS
                    _handleUserMessage(_textController.text);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 80)
        ],
      ),
    );
  }
}
// TEMPLATE PARA CADA MENSAJE
class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMinerva;

  const MessageBubble({
    required this.message,
    required this.isMinerva,
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Align(
      alignment: isMinerva ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMinerva ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
