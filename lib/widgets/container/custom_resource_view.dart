import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomResource extends StatelessWidget {
  late String title;
  late String author;
  late String type;
  late String bytes;
  late bool isChecked;
  late String imagePath;

  CustomResource({
    required this.title,
    required this.author,
    required this.type,
    required this.bytes,
    required this.isChecked,
    required this.imagePath, // Ruta de la imagen
  });

  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Row(
      
      children: [
        
        Container(
          width: 100,
          height: 150,
          child: Image.asset(
              imagePath), 
        ),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              height: 30,
              decoration: BoxDecoration(
                color: actualTheme.colorScheme.onBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  color: actualTheme.colorScheme.onError,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 2.0,),
            Container(
             
              height: 30,
              decoration: BoxDecoration(
                color: actualTheme.colorScheme.onBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                author,
                style: TextStyle(
                  color: actualTheme.colorScheme.onError,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 2.0,),
            Container(
              
              height: 30,
              decoration: BoxDecoration(
                color: actualTheme.colorScheme.onBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Text(
                type,
                style: TextStyle(
                  color: actualTheme.colorScheme.onError,
                  fontSize: 14,
                ),
              ),
            ),
            
            Row(
              children: [
                Container(
                  
                  height: 30,
                  decoration: BoxDecoration(
                    color: actualTheme.colorScheme.onBackground,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    bytes,
                    style: TextStyle(
                      color: actualTheme.colorScheme.onError,
                      fontSize: 14,
                    ),
                  ),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
