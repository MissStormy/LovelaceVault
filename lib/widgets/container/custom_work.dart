import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/editor/word_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomWork extends StatelessWidget {
  late String fileName;
  late String date;

  CustomWork({required this.fileName, required this.date});

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return GestureDetector(
      onTap: () {
        // NAVEGAR A WORDSCREEN Y PASAR DATOS
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WordScreen(fileName: fileName),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.grey), 
          borderRadius: BorderRadius.circular(10.0), 
          color: actualTheme.colorScheme.background.withOpacity(0.4)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: PREVIEW DEL TEXTO
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/texto.png', fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // CONTAINER PARA AJUSTAR EL TEXTO
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    children: [
                      Text(
                        fileName,
                        style: TextStyle(
                          color: actualTheme.colorScheme.onError,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        ('Ultima edicion: $date'),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: actualTheme.colorScheme.onError,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
              ],
            )
          ],
        ),
      ),
    );
  }
}
