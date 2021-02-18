import 'package:fetch/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MyStack extends StatelessWidget{
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
      backgroundImage: AssetImage('assets/images/IMG_01080.png'),
      radius: 150,
    ),
    ),
    Positioned(
    left: 175,
    top: 175,
    child: Container(
    alignment: Alignment.center,
    width: 140,
    height: 140,
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage('assets/images/IMG_04020.png'),
      radius: 75,
    ),
    ),
    )
    ]
    );
  }
}