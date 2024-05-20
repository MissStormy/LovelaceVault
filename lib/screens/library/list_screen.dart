import 'package:flutter/material.dart';
import 'package:lovelacevault/data/resource.dart';
import 'package:lovelacevault/widgets/container/custom_resource_view.dart';
import 'package:lovelacevault/widgets/textfield/custom_searchbar.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final Resource resource = Resource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 5.0),
          CustomSearchBar(
            onSearch: (String) {
              
            },
          ),
          SizedBox(height: 10.0),
          // ------------ CARGA DE RECURSOS --------------
          Expanded(
            child: FutureBuilder<List<Resource>>(
              future: resource.getResources(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error: ${snapshot.error}"),
                  );
                } else {
                  final resources = snapshot.data!;
                  return ListView.builder(
                    itemCount: resources.length,
                    itemBuilder: (context, index) {
                      final resource = resources[index];
                      final collectionIndex = index % 3; 
                      return CustomResource(
                        title: resource.title,
                        author: resource.author,
                        type: resource.type,
                        bytes: resource.bytes,
                        isChecked: true, // TODO: Cambiar esto si es necesario
                        imagePath: resource.imagePath,
                        summary: resource.summary,
                        collectionIndex: collectionIndex, 
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
