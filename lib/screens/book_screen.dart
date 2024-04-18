import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
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
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final darkMode = actualTheme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: actualTheme.colorScheme.background.withOpacity(0.4),
      ),
      body: Stack(
        children: [
          // ----------- FONDO -----------
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: darkMode
                ? Container(
                    key: Key('darkModeBg'),
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black,
                    child: Image.asset('assets/bg_dark.jpeg', fit: BoxFit.cover),
                  )
                : Container(
                    key: Key('lightModeBg'),
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset('assets/bg.jpeg', fit: BoxFit.cover),
                  ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.0),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          widget.imagePath,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Acción al presionar el botón de favorito
                          },
                          child: Icon(Icons.favorite_border, color: actualTheme.colorScheme.onError),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Divider(),
                  Container(
                    width: MediaQuery.of(context).size.width + 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      //color: actualTheme.colorScheme.primary,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          color: actualTheme.colorScheme.primary.withOpacity(0.3),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: actualTheme.colorScheme.onError,
                                  ),
                                ),
                                Text(
                                  widget.author,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: actualTheme.colorScheme.onError,
                                  ),
                                ),
                                Divider(),
                                Text(
                                  widget.summary,
                                  maxLines: expanded ? 10 : 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: actualTheme.colorScheme.onError,),
                                ),
                                SizedBox(height: 10.0),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      expanded = !expanded;
                                    });
                                  },
                                  
                                  child: Text(expanded ? 'Less' : 'More', style: TextStyle(color: actualTheme.colorScheme.onError),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 10.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: actualTheme.colorScheme.surface.withOpacity(0.5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ejemplar mas cercano', style: TextStyle(color: actualTheme.colorScheme.error,),),
                        SizedBox(width: 10.0),
                        Row(
                          children: [
                            Text('Localización'),
                            IconButton(
                              icon: Icon(Icons.map),
                              onPressed: () {
                                // EXPANSION: CREAR UNA PANTALLA MAPS O QUE TE REDIRECCIONE AL MAPS
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

