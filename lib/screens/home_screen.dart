import 'package:flutter/material.dart';
import 'package:lovelacevault/data/resource.dart';
import 'package:lovelacevault/screens/profile_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/buttons/custom_filter_button.dart';
import 'package:lovelacevault/widgets/container/custom_resource_view.dart';
import 'package:lovelacevault/widgets/textfield/custom_searchbar.dart';
import 'package:lovelacevault/widgets/ui/custom_appbar.dart';
import 'package:provider/provider.dart';

enum ResourceType {
  Libro,
  Tesis,
  Recurso,
  Otros,
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CustomResource> allBooks = [
    CustomResource(
      title: "El horror de Dunwich",
      author: "François Baranger",
      type: "Libro",
      bytes: 1234,
      isChecked: false,
      imagePath: "assets/covers/dunwich.jpg",
      summary: 'aaaaaaaaaaaa',
    ),
    CustomResource(
      title: "Titulo insulso",
      author: "Autor insulso",
      type: "Tesis",
      bytes: 1234,
      isChecked: false,
      imagePath: "assets/book.jpeg",
      summary: '',
    ),
    CustomResource(
      title: "Titulo insulso",
      author: "Autor insulso",
      type: "Recurso",
      bytes: 1234,
      isChecked: false,
      imagePath: "assets/book.jpeg",
      summary: '',
    ),
  ];

  List<CustomResource> filteredBooks = [];

  void filterBooks(String query) {
    setState(() {
      filteredBooks = allBooks.where((book) {
        final title = book.title.toLowerCase();
        final author = book.author.toLowerCase();
        return title.contains(query.toLowerCase()) ||
            author.contains(query.toLowerCase());
      }).toList();
    });
  }
  void filterBooksByType(ResourceType type) {
    setState(() {
      filteredBooks = allBooks.where((book) => book.type == type.toString().split('.').last).toList();
    });
  }
  bool _isFilterExpanded = false;

  void toggleFilterExpansion() {
    setState(() {
      _isFilterExpanded = !_isFilterExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    filteredBooks = List.from(allBooks);
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: CustomRoundedAppBar(
        line1: 'Bienvenido de vuelta,',
        line2: 'User',
        notificationButton: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: Colors.black54, // Fondo semitransparente
                  child: ListView.builder(
                    itemCount: 10, // Coloca aquí la cantidad de notificaciones
                    itemBuilder: (context, index) {
                      // Placeholder de notificación
                      return ListTile(
                        title: Text('Notificación $index'),
                      );
                    },
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.notifications), // Icono de notificaciones
        ),
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
                bottomLeft: Radius.circular(40.0),
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
            child: CustomSearchBar(
              onSearch: filterBooks,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
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
                        topLeft: Radius.circular(40.0),
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
                        SizedBox(height: 10.0),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredBooks.length,
                          itemBuilder: (context, index) {
                            final book = filteredBooks[index];
                            return book;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
              children: [
                IconButton(
                  onPressed: toggleFilterExpansion,
                  icon: Icon(Icons.tune),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: _isFilterExpanded ? MediaQuery.of(context).size.width - 50 : 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomFilterButton(
                          text: "Tesis",
                          onTap: () {
                            filterBooksByType(ResourceType.Tesis);
                          },
                        ),
                        SizedBox(width: 2.0),
                        CustomFilterButton(
                          text: "Libro",
                          onTap: () {
                            filterBooksByType(ResourceType.Libro);
                          },
                        ),
                        SizedBox(width: 2.0),
                        CustomFilterButton(
                          text: "Recurso",
                          onTap: () {
                            filterBooksByType(ResourceType.Recurso);
                          },
                        ),
                        SizedBox(width: 2.0),
                        CustomFilterButton(
                          text: "Otros",
                          onTap: () {
                            filterBooksByType(ResourceType.Otros);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    ]));
  }
}
