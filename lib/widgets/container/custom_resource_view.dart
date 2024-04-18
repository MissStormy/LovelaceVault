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
    // -------------- GESTURE DETECTOR -------------
    return GestureDetector(
      onTap: () {
        // ---------- NAVIGATOR ---------
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookScreen(
              imagePath: imagePath,
              title: title,
              author: author,
              summary: summary, 
              bytes: ("$bytes"), 
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.grey), 
          borderRadius: BorderRadius.circular(10.0), 
          color: actualTheme.colorScheme.background.withOpacity(0.4)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), 
                
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), 
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 5.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: actualTheme.colorScheme.onError,
                        fontSize: 15.0, 
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2, 
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      author,
                      style: TextStyle(
                        color: actualTheme.colorScheme.onError,
                        fontSize: 14.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      type,
                      style: TextStyle(
                        color: actualTheme.colorScheme.onError,
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
                            color: actualTheme.colorScheme.onError,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.0),
                    Container(
                      width: double.infinity, 
                      child: Text(
                        summary,
                        style: TextStyle(
                          color: actualTheme.colorScheme.onError,
                          fontSize: 10.0,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
