import 'package:flutter/material.dart';
import 'package:lovelacevault/data/resource.dart';
import 'package:lovelacevault/screens/profile_screen.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/buttons/custom_filter_button.dart';
import 'package:lovelacevault/widgets/container/custom_resource_view.dart';
import 'package:lovelacevault/widgets/spacers/h_spacer_10.dart';
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
  // BUSCADOR (PLACEHOLDER)
  // TODO: MEJORAR
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
  // ARRAY PARA GUARDAR LOS LIBROS FILTRADOS
  List<CustomResource> filteredBooks = [];
  // FILTRADO POR TITULO Y AUTOR
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

  // FILTRADO POR TIPO
  void filterBooksByType(ResourceType type) {
    setState(() {
      filteredBooks = allBooks
          .where((book) => book.type == type.toString().split('.').last)
          .toList();
    });
  }

  // SITUACION ACTUAL DEL BOTON DE FILTROS
  bool _isFilterExpanded = false;
  // SI EL BOTON NO ESTA EXPANDIDO, EXPANDIR Y VICEVERSA
  void toggleFilterExpansion() {
    setState(() {
      _isFilterExpanded = !_isFilterExpanded;
    });
  }

  // INICIALIZAMOS LAS VARIABLES
  @override
  void initState() {
    super.initState();
    filteredBooks = List.from(allBooks);
  }

  @override
  Widget build(BuildContext context) {
    // GENERAMOS UNA NUEVA INSTANCIA PARA CARGAR LOS RECURSOS
    final Resource resource = Resource();
    // CARGAMOS EL PROVIDER DEL TEMA
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
        appBar: CustomRoundedAppBar(
          line1: 'Bienvenido de vuelta,',
          line2: 'User',
          notificationButton: IconButton(
            onPressed: () {
              // -------- BOTTOM SHEET: NOTIFS --------
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: actualTheme.colorScheme.primary,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        // PLACEHOLDER
                        return ListTile(
                          title: Text('Notificación $index'),
                        );
                      },
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.notifications),
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
        // ------------------- BODY ---------------------
        body: Stack(
        children: [
        SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.0,
                ),
                // ----------------- SEARCHBAR ------------------
                 CustomSearchBar(
                    onSearch: filterBooks,
                  ),
                
                HSpacer10(),

                // ----------------- RESOURCES LIST ------------------
                FutureBuilder<List<Resource>>(
                  future: resource.getResources(),
                  builder: (context, snapshot) {
                    // ------------- LOADING --------------
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      // ----------- DETECCION DE ERRORES -----------
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    } else {
                      // ----------- SNAPSHOT ------------
                      final resources = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: resources.length,
                        itemBuilder: (context, index) {
                          final resource = resources[index];
                          return CustomResource(
                            title: resource.title,
                            author: resource.author,
                            type: resource.type,
                            bytes: resource.bytes,
                            isChecked: true, // TODO: CAMBIAR ESTO, YA NO ES NECESARIO
                            imagePath: resource.imagePath,
                            summary: resource.summary,
                          );
                        },
                      );
                    }
                  },
                ),

                
                
        ],
        
    ), 
    
    )]));
  }
}
