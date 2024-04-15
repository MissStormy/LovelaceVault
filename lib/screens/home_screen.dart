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
      filteredBooks = allBooks.where((book) => book.type == type.toString().split('.').last).toList();
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
            // AL PULSAR EL BOTON DE LAS NOTIFICACIONES, SE DESPLIEGA UNA BOTTOM SHEET
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: const Color.fromARGB(137, 253, 244, 244),
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
                    // CARGAMOS LOS DATOS DE LA TABLA resources Y LOS PONEMOS EN EL TEMPLATE DE LOS RESOURCES
                    // EN CASO DE QUE NO CONSIGA CARGAR, O TARDE, APARECERA UN CIRCULO DE CARGA
                    child: FutureBuilder<List<Resource>>(
                          future: resource.getResources(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            // DETECCION DE ERRORES
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text("Error: ${snapshot.error}"),
                              );
                            } else {
                              //CARGAMOS EL SNAPSHOT
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
                        )
                  ),
                ),
              ),
            ),
          ),
          Row(
            // EL BOTON DE FILTROS PERMITE TOGGLEAR LAS VISTAS DE EXPANDIDO Y CONTRAIDO
              children: [
                IconButton(
                  onPressed: toggleFilterExpansion,
                  icon: Icon(Icons.tune),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  // TAMAÑO ABIERTO -> PANTALLA -50 : TAMAÑO CERRADO -> 0
                  width: _isFilterExpanded ? MediaQuery.of(context).size.width - 50 : 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // FILTRADO POR TIPO
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
