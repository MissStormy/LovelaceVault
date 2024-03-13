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
          Column(
              children: [
                WorkCard(
                  image: 'assets/necronomicon.jpg', 
                  workTitle: 'Necronomicon', 
                  author: 'H.P.Lovecraft', 
                  bytes: '1234', 
                  showWork: () => widget.showWork(), 
                  typeOfWork: 'Book', 
                  resume: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus turpis mauris. Vivamus bibendum fermentum augue, ac eleifend lectus efficitur vel. Phasellus mattis lobortis mauris id sodales. Pellentesque aliquet odio sit amet elementum venenatis. In ultrices scelerisque est a condimentum. In ac vehicula nibh, non pretium felis. Fusce porttitor, risus sit amet scelerisque rutrum, nunc velit tristique sem, at malesuada lorem nisi vitae odio. Nunc et massa diam.Phasellus consequat justo nec dictum lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus fermentum imperdiet mauris ac pretium. Ut egestas aliquam gravida. Ut gravida est vel diam sagittis, sit amet consectetur velit malesuada. Maecenas condimentum augue ut elit posuere consectetur. Nunc elementum dui eu justo malesuada condimentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam vulputate ante at suscipit tincidunt. Integer congue gravida nunc, in sagittis elit aliquam id. Etiam dolor sem, luctus in leo et, vestibulum elementum purus. Curabitur semper erat erat, id mollis sapien efficitur sit amet.Nulla varius, massa in convallis dapibus, lorem nisi viverra tellus, iaculis porttitor sem justo ut ex. Sed laoreet nisl eu mauris congue scelerisque. Pellentesque eget felis molestie, cursus tortor sed, ullamcorper nibh. Maecenas nec aliquam neque, in elementum eros. Curabitur tempor hendrerit arcu eget dignissim. Maecenas eu sodales est. Phasellus quis massa id lacus pharetra efficitur. Maecenas aliquam malesuada quam, vel vestibulum lacus tempus eget. Aenean ac metus accumsan, gravida nisi condimentum, congue orci. Quisque malesuada lorem non massa finibus, non elementum nibh accumsan. Mauris laoreet nisl vel ipsum efficitur molestie. Morbi imperdiet lectus non eros imperdiet, sit amet sodales felis commodo. Nullam at dolor efficitur, scelerisque enim a, efficitur ipsum. Sed ullamcorper lectus id est fringilla sodales.Nulla blandit pulvinar molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum sapien velit, sed bibendum nibh finibus nec. Vivamus id ipsum cursus turpis ullamcorper congue vitae id nunc. Integer ac blandit felis. Donec convallis massa in lacus ullamcorper, nec porttitor quam vehicula. Proin blandit imperdiet lacus, sodales dapibus massa euismod at. Nunc bibendum mi non tortor lacinia vestibulum.Nullam risus augue, faucibus porta pharetra eget, mattis vel elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus porttitor nisl ut pretium tempor. Sed ultrices velit odio. Integer in nunc faucibus, placerat urna quis, posuere ipsum. Sed quis neque eget augue varius iaculis in a ligula. Cras ut magna aliquet, vestibulum metus at, cursus orci.', 
                  id: 'ID-HPLN',),
                  SizedBox(height: 10.0,),
                   WorkCard(
                  image: 'assets/necronomicon.jpg', 
                  workTitle: 'Necronomicon', 
                  author: 'H.P.Lovecraft', 
                  bytes: '1234', 
                  showWork: () => widget.showWork(), 
                  typeOfWork: 'Book', 
                  resume: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus turpis mauris. Vivamus bibendum fermentum augue, ac eleifend lectus efficitur vel. Phasellus mattis lobortis mauris id sodales. Pellentesque aliquet odio sit amet elementum venenatis. In ultrices scelerisque est a condimentum. In ac vehicula nibh, non pretium felis. Fusce porttitor, risus sit amet scelerisque rutrum, nunc velit tristique sem, at malesuada lorem nisi vitae odio. Nunc et massa diam.Phasellus consequat justo nec dictum lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus fermentum imperdiet mauris ac pretium. Ut egestas aliquam gravida. Ut gravida est vel diam sagittis, sit amet consectetur velit malesuada. Maecenas condimentum augue ut elit posuere consectetur. Nunc elementum dui eu justo malesuada condimentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam vulputate ante at suscipit tincidunt. Integer congue gravida nunc, in sagittis elit aliquam id. Etiam dolor sem, luctus in leo et, vestibulum elementum purus. Curabitur semper erat erat, id mollis sapien efficitur sit amet.Nulla varius, massa in convallis dapibus, lorem nisi viverra tellus, iaculis porttitor sem justo ut ex. Sed laoreet nisl eu mauris congue scelerisque. Pellentesque eget felis molestie, cursus tortor sed, ullamcorper nibh. Maecenas nec aliquam neque, in elementum eros. Curabitur tempor hendrerit arcu eget dignissim. Maecenas eu sodales est. Phasellus quis massa id lacus pharetra efficitur. Maecenas aliquam malesuada quam, vel vestibulum lacus tempus eget. Aenean ac metus accumsan, gravida nisi condimentum, congue orci. Quisque malesuada lorem non massa finibus, non elementum nibh accumsan. Mauris laoreet nisl vel ipsum efficitur molestie. Morbi imperdiet lectus non eros imperdiet, sit amet sodales felis commodo. Nullam at dolor efficitur, scelerisque enim a, efficitur ipsum. Sed ullamcorper lectus id est fringilla sodales.Nulla blandit pulvinar molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum sapien velit, sed bibendum nibh finibus nec. Vivamus id ipsum cursus turpis ullamcorper congue vitae id nunc. Integer ac blandit felis. Donec convallis massa in lacus ullamcorper, nec porttitor quam vehicula. Proin blandit imperdiet lacus, sodales dapibus massa euismod at. Nunc bibendum mi non tortor lacinia vestibulum.Nullam risus augue, faucibus porta pharetra eget, mattis vel elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus porttitor nisl ut pretium tempor. Sed ultrices velit odio. Integer in nunc faucibus, placerat urna quis, posuere ipsum. Sed quis neque eget augue varius iaculis in a ligula. Cras ut magna aliquet, vestibulum metus at, cursus orci.', 
                  id: 'ID-HPLN',),
                  SizedBox(height: 10.0,),
                   WorkCard(
                  image: 'assets/necronomicon.jpg', 
                  workTitle: 'Necronomicon', 
                  author: 'H.P.Lovecraft', 
                  bytes: '1234', 
                  showWork: () => widget.showWork(), 
                  typeOfWork: 'Book', 
                  resume: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus turpis mauris. Vivamus bibendum fermentum augue, ac eleifend lectus efficitur vel. Phasellus mattis lobortis mauris id sodales. Pellentesque aliquet odio sit amet elementum venenatis. In ultrices scelerisque est a condimentum. In ac vehicula nibh, non pretium felis. Fusce porttitor, risus sit amet scelerisque rutrum, nunc velit tristique sem, at malesuada lorem nisi vitae odio. Nunc et massa diam.Phasellus consequat justo nec dictum lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus fermentum imperdiet mauris ac pretium. Ut egestas aliquam gravida. Ut gravida est vel diam sagittis, sit amet consectetur velit malesuada. Maecenas condimentum augue ut elit posuere consectetur. Nunc elementum dui eu justo malesuada condimentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam vulputate ante at suscipit tincidunt. Integer congue gravida nunc, in sagittis elit aliquam id. Etiam dolor sem, luctus in leo et, vestibulum elementum purus. Curabitur semper erat erat, id mollis sapien efficitur sit amet.Nulla varius, massa in convallis dapibus, lorem nisi viverra tellus, iaculis porttitor sem justo ut ex. Sed laoreet nisl eu mauris congue scelerisque. Pellentesque eget felis molestie, cursus tortor sed, ullamcorper nibh. Maecenas nec aliquam neque, in elementum eros. Curabitur tempor hendrerit arcu eget dignissim. Maecenas eu sodales est. Phasellus quis massa id lacus pharetra efficitur. Maecenas aliquam malesuada quam, vel vestibulum lacus tempus eget. Aenean ac metus accumsan, gravida nisi condimentum, congue orci. Quisque malesuada lorem non massa finibus, non elementum nibh accumsan. Mauris laoreet nisl vel ipsum efficitur molestie. Morbi imperdiet lectus non eros imperdiet, sit amet sodales felis commodo. Nullam at dolor efficitur, scelerisque enim a, efficitur ipsum. Sed ullamcorper lectus id est fringilla sodales.Nulla blandit pulvinar molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum sapien velit, sed bibendum nibh finibus nec. Vivamus id ipsum cursus turpis ullamcorper congue vitae id nunc. Integer ac blandit felis. Donec convallis massa in lacus ullamcorper, nec porttitor quam vehicula. Proin blandit imperdiet lacus, sodales dapibus massa euismod at. Nunc bibendum mi non tortor lacinia vestibulum.Nullam risus augue, faucibus porta pharetra eget, mattis vel elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus porttitor nisl ut pretium tempor. Sed ultrices velit odio. Integer in nunc faucibus, placerat urna quis, posuere ipsum. Sed quis neque eget augue varius iaculis in a ligula. Cras ut magna aliquet, vestibulum metus at, cursus orci.', 
                  id: 'ID-HPLN',),
                  SizedBox(height: 10.0,),
              ],
            ),
          
        ],)
        
      )
    );
  }
}