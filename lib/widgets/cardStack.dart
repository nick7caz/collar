import 'package:flutter/material.dart';

class CardStack extends StatelessWidget {
  final photo, petPhoto;

  const CardStack({this.photo, this.petPhoto});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(overflow: Overflow.visible, children: [
      Container(
        alignment: Alignment.centerLeft,
        width: 250,
        height: 250,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(photo),
          radius: 125,
        ),
      ),
      Positioned(
        left: 150,
        top: 200,
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 150,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/IMG_04020.png'),
            radius: 85,
          ),
        ),
      )
    ]);
  }
}
