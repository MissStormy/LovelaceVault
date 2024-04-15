import 'package:flutter/material.dart';
// ESTA PANTALLA RECOGE LOS DATOS DEL RECURSO ABIERTO
class BookScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String author;
  final String bytes;
  final String summary;

  BookScreen({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.summary,
    required this.bytes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // TODO: AL PULSAR TIENE QUE CAMBIAR EL DISEÑO DEL ICONO
                    },
                  ),
                  SizedBox(width: 10.0),
                  Image.asset(
                    imagePath,
                    width: 100,
                    height: 150,
                  ), 
                  SizedBox(width: 10.0),
                  Text(bytes), 
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.8, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.shade200,
                ),
                padding: EdgeInsets.all(10.0),
                child: Center(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      author,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      summary,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        // AL PULSAR, SE EXTENDERA EL TEXTO HASTA EL MAXIMO DE SUS CARACTERES
                      },
                      child: Text('More'),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade300,
                      ),
                      child: Row(
                        children: [
                          Text('Ejemplar mas cercano'),
                          SizedBox(width: 10.0),
                          Text('Localización'),
                          IconButton(
                            icon: Icon(Icons.map),
                            onPressed: () {
                              // EXPANSION: CREAR UNA PANTALLA MAPS O QUE TE REDIRECCIONE AL MAPS
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),)
                
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
