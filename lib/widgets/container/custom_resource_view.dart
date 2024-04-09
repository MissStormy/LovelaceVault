import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/book_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';


class CustomResource extends StatelessWidget {
  late String title;
  late String author;
  late String type;
  late int bytes;
  late bool isChecked;
  late String imagePath;
  late String summary;

  CustomResource({
    required this.title,
    required this.author,
    required this.type,
    required this.bytes,
    required this.isChecked,
    required this.imagePath,
    required this.summary
  });

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;

    return GestureDetector(
      onTap: () {
        // Navegar a la pantalla BookScreen y pasar los datos
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookScreen(
              imagePath: imagePath,
              title: title,
              author: author,
              summary: summary, bytes: ("$bytes"), // Ajusta el resumen según tus datos
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        //padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Borde fino
          borderRadius: BorderRadius.circular(10.0), // Esquinas redondeadas
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Esquinas redondeadas
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // Esquinas redondeadas
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.0, // Título un poco más grande
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_border),
                      SizedBox(width: 4.0),
                      Text(
                        ("$bytes"),
                        style: TextStyle(
                          fontSize: 11.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    width: MediaQuery.of(context).size.width - 300, // Ancho máximo del texto
                    child: Text(
                      summary,
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
