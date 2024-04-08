import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/profile_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/buttons/custom_filter_button.dart';
import 'package:lovelacevault/widgets/container/custom_resource_view.dart';
import 'package:lovelacevault/widgets/textfield/custom_searchbar.dart';
import 'package:lovelacevault/widgets/ui/custom_appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
     final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
        appBar: CustomRoundedAppBar(
          line1: 'Bienvenido de vuelta,',
          line2: 'User',
          action: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            icon: Image.asset('assets/profile.png'),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            Container(
                margin: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Color de la sombra
                      spreadRadius: 2, // Extensión de la sombra
                      blurRadius: 5, // Difuminado de la sombra
                      offset:
                          Offset(0, 3), // Desplazamiento de la sombra en x y y
                    ),
                  ],
                ),
                child: CustomSearchBar(
                  onSearch: (query) {
                    print('Realizar búsqueda con query: $query');
                  },
                )),
            SizedBox(
              height: 10.0,
            ),
            // Sidescroll buttons "filter"
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomFilterButton(
                      text: "Tesis",
                      color: const Color.fromARGB(255, 244, 107, 107),
                      onTap: () {}),
                  SizedBox(width: 2.0),
                  CustomFilterButton(
                      text: "Libro",
                      color: const Color.fromARGB(255, 245, 174, 68),
                      onTap: () {}),
                  SizedBox(width: 2.0),
                  CustomFilterButton(
                      text: "Recurso",
                      color: Color.fromARGB(255, 89, 171, 78),
                      onTap: () {}),
                  SizedBox(width: 2.0),
                  CustomFilterButton(
                      text: "Otros",
                      color: Color.fromARGB(255, 234, 118, 240),
                      onTap: () {}),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: 360.0,
            child: Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: actualTheme.colorScheme.surface,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Tu búsqueda",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  //Lista de libros y recursos
                  CustomResource(
                    title: "Titulo insulso",
                    author: "Autor insulso",
                    type: "Libro",
                    bytes: "1234",
                    isChecked: false,
                    imagePath: "assets/book.jpeg",
                  ),
                  SizedBox(height: 10.0),
                  CustomResource(
                    title: "Titulo insulso",
                    author: "Autor insulso",
                    type: "Libro",
                    bytes: "1234",
                    isChecked: false,
                    imagePath: "assets/book.jpeg",
                  ),
                  SizedBox(height: 10.0),
                  CustomResource(
                    title: "Titulo insulso",
                    author: "Autor insulso",
                    type: "Libro",
                    bytes: "1234",
                    isChecked: false,
                    imagePath: "assets/book.jpeg",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    
          ],
        ));
  }
}
