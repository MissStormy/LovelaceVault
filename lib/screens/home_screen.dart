import 'package:flutter/material.dart';
import 'package:lovelacevault/data/resource.dart';
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
    final Resource resource = Resource();
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Scaffold(
      appBar: CustomRoundedAppBar(
        line1: 'Bienvenido de vuelta,',
        line2: 'User',
        notificationButton: IconButton(
          // Botón de notificaciones opcional
          onPressed: () {
            // Acción al presionar el botón de notificaciones
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
                        FutureBuilder(future: 
                        resource.getResources(), 
                        builder: (context, AsyncSnapshot<List<Resource>> snapshot){
                          if(snapshot.hasData){
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index){
                                return CustomResource(
                                  title: snapshot.data![index].title, 
                                  author: snapshot.data![index].author, 
                                  type: snapshot.data![index].type, 
                                  bytes: snapshot.data![index].bytes, 
                                  isChecked: true, 
                                  imagePath: snapshot.data![index].imagePath, 
                                  summary: snapshot.data![index].summary);
                              },
                            );
                          }else {
                          return const Center(
                            //While the DB loads, display a progress indicator
                            child: CircularProgressIndicator(),
                          );
                        }
                        })
                        
                        //Lista de libros y recursos

                        /* CustomResource(
                          title: "El horror de Dunwich",
                          author: "François Baranger",
                          type: "Libro",
                          bytes: "1234",
                          isChecked: false,
                          imagePath: "assets/covers/dunwich.jpg", summary: '',
                        ),
                        SizedBox(height: 10.0),
                        CustomResource(
                          title: "Titulo insulso",
                          author: "Autor insulso",
                          type: "Libro",
                          bytes: "1234",
                          isChecked: false,
                          imagePath: "assets/book.jpeg", summary: '',
                        ),
                        SizedBox(height: 10.0),
                        CustomResource(
                          title: "Titulo insulso",
                          author: "Autor insulso",
                          type: "Libro",
                          bytes: "1234",
                          isChecked: false,
                          imagePath: "assets/book.jpeg", summary: '',
                        ) */
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 5.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.tune)),
                  CustomFilterButton(
                      text: "Tesis",
                      
                      onTap: () {}),
                  SizedBox(width: 2.0),
                  CustomFilterButton(
                      text: "Libro",
                      
                      onTap: () {}),
                  SizedBox(width: 2.0),
                  CustomFilterButton(
                      text: "Recurso",
                      
                      onTap: () {}),
                  SizedBox(width: 2.0),
                  CustomFilterButton(
                      text: "Otros",
                      
                      onTap: () {}),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
