import 'package:flutter/material.dart';

class Byte extends StatefulWidget {
  const Byte({super.key});

  @override
  State<Byte> createState() => _ByteState();
}

class _ByteState extends State<Byte> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          
          isPressed = !isPressed;
        });
      },
      child: SizedBox(
        width: 32, 
        height: 32,
        child: Image.asset(isPressed ? 'assets/byte_full.png' : 'assets/byte_empty.png'),
      ),
    );
  }
}
// class Byte extends StatelessWidget {
//   //----------------------------------------------------
//   // Widget to change the image of the Byte when touched
//   //----------------------------------------------------

//   //------------------------------------------------------------------------
//   // On the first place, the Byte is empty = false and when the user touches
//   // it to save as a favorite, the Byte fills up = true
//   //------------------------------------------------------------------------
//   final bool isPressed = false;

//   const Byte({super.key});
  

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){},
//       child: Image.asset('assets/byte_empty.png'),
//     );
//   }
// }