import 'package:flutter/material.dart';

class WorkCard extends StatelessWidget {
  //----------
  // VARIABLES
  //----------
  final String image;
  final String typeOfWork;
  final String workTitle;
  final String author;
  final String resume;
  final String isbn;
  final String bytes;
  final VoidCallback showWork;

  const WorkCard(
      {super.key,
      required this.image,
      required this.workTitle,
      required this.author,
      required this.bytes,
      required this.showWork,
      required this.typeOfWork,
      required this.resume,
      required this.isbn});

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
              height: 100,
              margin: EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Image.asset(image)),
          
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                typeOfWork,
                style: TextStyle(fontFamily: 'Bookman Old Style', fontSize: 10),
              ),
              Text(
                workTitle,
                style: TextStyle(fontFamily: 'Bookman Old Style', fontSize: 20),
              ),
              //SizedBox(height: 5.0,),
              Text(
                author,
                style: TextStyle(fontFamily: 'Bookman Old Style', fontSize: 15),
              ),
              Container(
                width: 150,
                height: 50,
                child: Text(
                  resume,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style:
                      TextStyle(fontFamily: 'Bookman Old Style', fontSize: 10),
                ),
              ),

              Text(
                isbn,
                style: TextStyle(fontFamily: 'Bookman Old Style', fontSize: 10),
              )
            ],
          ),
          ),
          
          SizedBox(
            width: 10.0,
          ),
          Container(
              //margin: EdgeInsets.symmetric(horizontal: 10.0),
              padding: EdgeInsets.all(5.0),
              /* decoration: BoxDecoration(
              
              border: Border.all(
                color: Colors.black
              )
            ), */
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () => showWork(), child: Text('See work')),
                  /* Ink(
                decoration: const ShapeDecoration(
                  color: Colors.grey,
                  shape: CircleBorder(),
                ),
                child:
                    IconButton(onPressed: () => showWork(), icon: Icon(Icons.visibility)),
              ), */
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
              ))
        ],
      ),
    );
  }
}
