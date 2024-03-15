import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/containers/work_card.dart';
import 'package:lovelacevault/models/resource.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  final VoidCallback showWork;
  final VoidCallback showSettings;
  const Home({super.key, required this.showWork, required this.showSettings});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    final Resource resource = Resource();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.jpg'),
          fit: BoxFit.cover,
        ), 
        leading: Image.asset('assets/lovelace_Logo.png'),
        title: Text('Home', style: TextStyle(fontFamily: 'Bookman Old Style'),),
        actions: [
          IconButton(
            onPressed: () => widget.showSettings(), 
            icon: Icon(Icons.account_circle_outlined))
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(height: 20.0),
          Text('What are you searching for?', 
          style: TextStyle(
            fontFamily: 'Bookman Old Style',
            fontSize: 20
          ),),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchBar()
          ),
          SizedBox(height: 10.0),
          const Divider(
            indent: 30,
            endIndent: 30,
          ),
          FutureBuilder(
            future: resource.getResources(), 
            builder: (context, AsyncSnapshot<List<Resource>> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    return WorkCard(
                      image: 'assets/necronomicon.jpg', 
                      workTitle: snapshot.data![index].title, 
                      author: snapshot.data![index].isbn, 
                      bytes: snapshot.data![index].bytes, 
                      showWork: () => widget.showWork(), 
                      typeOfWork: snapshot.data![index].type, 
                      resume: snapshot.data![index].isbn, 
                      isbn: snapshot.data![index].isbn);
                  });
              }else {
                          return const Center(
                            //While the DB loads, display a progress indicator
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
            ])),
          
        
      
    );
  }
}