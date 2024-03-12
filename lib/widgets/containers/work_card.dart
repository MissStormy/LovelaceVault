import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  //----------
  // VARIABLES
  //----------
  final String image;
  final String workTitle;
  final String author;
  final String bytes;
  final VoidCallback showWork;

  const WorkCard(
      {super.key,
      required this.image,
      required this.workTitle,
      required this.author,
      required this.bytes, required this.showWork});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 214, 214),
        //border: Border.all(color: Colors.black),
        //borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            
            blurRadius: 7,
            offset: Offset(4, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.asset(image)),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                workTitle,
                style: TextStyle(fontFamily: 'Bookman Old Style', fontSize: 20),
              ),
              SizedBox(height: 10.0,),
              Text(
                author,
                style: TextStyle(fontFamily: 'Bookman Old Style', fontSize: 15),
              )
            ],
          ),
          SizedBox(
            width: 80.0,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            /* decoration: BoxDecoration(
              
              border: Border.all(
                color: Colors.black
              )
            ), */
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.grey,
                  shape: CircleBorder(),
                ),
                child:
                    IconButton(onPressed: () => showWork(), icon: Icon(Icons.visibility)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset('assets/byte_full.png'),
                  ),
                  Text(bytes)
                ],
              )
            ],
          )
          )
          
        ],
      ),
    );
  }
}
