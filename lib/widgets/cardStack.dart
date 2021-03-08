import 'package:flutter/material.dart';


class CardStack extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            alignment: Alignment.center,
            width: 300,
            height: 300,
          ),
          Container(
            alignment: Alignment.center,
            width: 300,
            height: 300,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/profileimg.png'),
              radius: 150,
            ),
          ),
          // Positioned(
          //   left: 80,
          //   top: 250,
          //   child: Container(
          //     alignment: Alignment.center,
          //     width: 140,
          //     height: 140,
          //     child: CircleAvatar(
          //       backgroundColor: Colors.transparent,
          //       backgroundImage: AssetImage('assets/images/profileimg.png'),
          //       radius: 75,
          //     ),
          //   ),
          // )
        ]
    );
  }
}