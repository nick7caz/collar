import 'package:fetch/ui/cardProfile.dart';
import 'package:fetch/widgets/photo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profileWidget(
    {padding,
    photoHeight,
    photoWidth,
    clipRadius,
    photo,
    containerHeight,
    containerWidth,
    child,
    userId,
    userRepository}) {
  return Scaffold(
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
    child:Container(
      padding: EdgeInsets.all(padding),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(10.0, 10.0),
          )
        ],
        borderRadius: BorderRadius.circular(clipRadius),
      ),
      child: Column(
        children: <Widget>[
          Stack( children: <Widget>[
          Container(
            width: photoWidth,
            height: photoHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(clipRadius),
              child: PhotoWidget(
                photoLink: photo,
              ),
            ),
          ),
      Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(clipRadius),
              bottomRight: Radius.circular(clipRadius),
            )),
        width: containerWidth,
        height: containerHeight,
        child: child,
      ),]
          ),
          Container(child: CardProfile(),),
          Container(child: PhotoWidget(
            photoLink: photo,))
        ],
      ),
    ),
    ),
    )
  );
}
