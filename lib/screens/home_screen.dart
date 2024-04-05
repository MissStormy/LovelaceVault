import 'package:flutter/material.dart';
import 'package:lovelacevault/screens/profile_screen.dart';
import 'package:lovelacevault/widgets/textfield/custom_searchbar.dart';
import 'package:lovelacevault/widgets/ui/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                ),
                child: CustomSearchBar(
                  onSearch: (query) {
                    print('Realizar búsqueda con query: $query');
                  },
                )),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Holi',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // Aquí puedes agregar más contenido si es necesario
                  ],
                ),
              ),
            ),
          ),
            
          ],
        ));
  }
}
