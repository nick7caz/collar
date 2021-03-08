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
    width: 200,
    height: 325,
    ),
    Positioned(
      right: 30,
      child: Container(
    alignment: Alignment.center,
    width: 300,
    height: 300,
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage('assets/images/profileimg.png'),
      radius: 150,
    ),
    ),),
    Positioned(
    left: 150,
    top: 100,
    child: Container(
    alignment: Alignment.center,
    width: 160,
    height: 160,
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage('assets/images/IMG_04020.png'),
      radius: 100,
    ),
    ),
    )
    ]
    );
  }
}