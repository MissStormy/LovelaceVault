import 'package:flutter/material.dart';
import 'package:lovelacevault/data/resource.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 6, // Ejemplo: 6 colecciones
        itemBuilder: (context, index) {
          return CollectionAccordion(index: index);
        },
      ),
    );
  }
}

class CollectionAccordion extends StatelessWidget {
  final int index;

  const CollectionAccordion({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ----------- CARGA DE RECURSOS -------------
    return FutureBuilder<List<Resource>>(
      future: getResourcesForCollection(index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ExpansionTile(
            title: Text('Colección $index (Cargando)'),
            children: [Container()],
          );
        } else if (snapshot.hasError) {
          return ExpansionTile(
            title: Text('Colección $index (Error)'),
            children: [Container()],
          );
        } else {
          final resources = snapshot.data!;
          return ExpansionTile(
            title: Text('Colección $index (${resources.length} recursos)'),
            children: [
              for (var resource in resources)
                ListTile(
                  title: Text(resource.title),
                  onTap: () {
                    
                  },
                ),
            ],
          );
        }
      },
    );
  }

  Future<List<Resource>> getResourcesForCollection(int collectionIndex) async {
   
    // LOGICA PARA OBTENER RECURSO SEGUN INDICE
    
    return await Resource().getResources(); 
  }
}





