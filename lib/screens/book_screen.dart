import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  final String imagePath; // Ruta de la imagen
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
                      // Lógica para cambiar entre corazón relleno y contorno
                    },
                  ),
                  SizedBox(width: 10.0),
                  Image.asset(
                    imagePath,
                    width: 100,
                    height: 150,
                  ), // Imagen del libro
                  SizedBox(width: 10.0),
                  Text(bytes), // Título del libro
                ],
              ),
              SizedBox(height: 10.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.8, // Ancho máximo del contenedor
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
                        // Lógica para expandir el resumen completo
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
                              // Lógica para abrir mapa
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
