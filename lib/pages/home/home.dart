import 'package:flutter/material.dart';
import 'package:lovelacevault/widgets/containers/work_card.dart';

class Home extends StatefulWidget {
  final VoidCallback showWork;
  final VoidCallback showProfile;
  const Home({super.key, required this.showWork, required this.showProfile});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
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
            onPressed: () => widget.showProfile(), 
            icon: Icon(Icons.account_circle_outlined))
        ],
      ),
      
      body: Column(
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
           SingleChildScrollView(
            child: Column(
              children: [
                WorkCard(
                  image: 'assets/lovelace_Logo.png', 
                  workTitle: 'Necronomicon', 
                  author: 'H.P.Lovecraft', 
                  bytes: '1234', 
                  showWork: () => widget.showWork(),)
              ],
            ),
          )
        ],
      )
    );
  }
}