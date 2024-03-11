import 'package:flutter/material.dart';

class WorkDetail extends StatefulWidget {
  const WorkDetail({super.key});

  @override
  State<WorkDetail> createState() => _WorkDetailState();
}

class _WorkDetailState extends State<WorkDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          
        }, icon: Icon(Icons.arrow_back)),
        title: Center(child: Text(
          'Details',
          style: TextStyle(
            fontFamily: 'Bookman Old Style'
          ),
        )),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                )
              ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //----------------------------------------------
                // Top left side: ISBN, TITLE, AUTHOR, PUBLISHED
                //----------------------------------------------
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ISBN'),
                    Text('TITLE OF BOOK'),
                    Text('By Author'),
                    Text('Published in')
                  ],
                ),),
                
                //---------------------------
                // Top right side: WORK PHOTO
                //---------------------------
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Column(
                  children: [
                    Center(child: Image.asset('assets/lovelace_Logo.png'))
                    
                  ],
                )),
                
              ],
            )),
            //------------------------------------
            // WORK ANALYTICS: READS, CITES, BYTES
            //------------------------------------
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pink
                ),
                
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //-------
                  // READS
                  //-------
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: Column(
                      children: [
                        Text('Reads'),
                        Text('1234')
                      ],
                    ),
                  ),
                  //-------
                  // CITES
                  //-------
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: Column(
                      children: [
                        Text('Cites'),
                        Text('1234')
                      ],
                    ),
                  ),
                  //-------
                  // Bytes
                  //-------
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: Column(
                      children: [
                        Text('Bytes'),
                        Text('1234')
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.pink
                  )
                ),
                child: Row(
                  //--------------
                  // TITLE OF WORK
                  //--------------
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('TITLE OF BOOK')
                  ],
                ),
              ),
              
            ),
            //-------------------
            // FULL TEXT OF WORK
            //-------------------
            Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                )
              ),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus turpis mauris. Vivamus bibendum fermentum augue, ac eleifend lectus efficitur vel. Phasellus mattis lobortis mauris id sodales. Pellentesque aliquet odio sit amet elementum venenatis. In ultrices scelerisque est a condimentum. In ac vehicula nibh, non pretium felis. Fusce porttitor, risus sit amet scelerisque rutrum, nunc velit tristique sem, at malesuada lorem nisi vitae odio. Nunc et massa diam.Phasellus consequat justo nec dictum lacinia. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus fermentum imperdiet mauris ac pretium. Ut egestas aliquam gravida. Ut gravida est vel diam sagittis, sit amet consectetur velit malesuada. Maecenas condimentum augue ut elit posuere consectetur. Nunc elementum dui eu justo malesuada condimentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam vulputate ante at suscipit tincidunt. Integer congue gravida nunc, in sagittis elit aliquam id. Etiam dolor sem, luctus in leo et, vestibulum elementum purus. Curabitur semper erat erat, id mollis sapien efficitur sit amet.Nulla varius, massa in convallis dapibus, lorem nisi viverra tellus, iaculis porttitor sem justo ut ex. Sed laoreet nisl eu mauris congue scelerisque. Pellentesque eget felis molestie, cursus tortor sed, ullamcorper nibh. Maecenas nec aliquam neque, in elementum eros. Curabitur tempor hendrerit arcu eget dignissim. Maecenas eu sodales est. Phasellus quis massa id lacus pharetra efficitur. Maecenas aliquam malesuada quam, vel vestibulum lacus tempus eget. Aenean ac metus accumsan, gravida nisi condimentum, congue orci. Quisque malesuada lorem non massa finibus, non elementum nibh accumsan. Mauris laoreet nisl vel ipsum efficitur molestie. Morbi imperdiet lectus non eros imperdiet, sit amet sodales felis commodo. Nullam at dolor efficitur, scelerisque enim a, efficitur ipsum. Sed ullamcorper lectus id est fringilla sodales.Nulla blandit pulvinar molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum sapien velit, sed bibendum nibh finibus nec. Vivamus id ipsum cursus turpis ullamcorper congue vitae id nunc. Integer ac blandit felis. Donec convallis massa in lacus ullamcorper, nec porttitor quam vehicula. Proin blandit imperdiet lacus, sodales dapibus massa euismod at. Nunc bibendum mi non tortor lacinia vestibulum.Nullam risus augue, faucibus porta pharetra eget, mattis vel elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus porttitor nisl ut pretium tempor. Sed ultrices velit odio. Integer in nunc faucibus, placerat urna quis, posuere ipsum. Sed quis neque eget augue varius iaculis in a ligula. Cras ut magna aliquet, vestibulum metus at, cursus orci.'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
         
        child: Icon(Icons.edit)),
    );
  }
}