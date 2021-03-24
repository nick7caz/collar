import 'package:Collar/ui/cardProfile.dart';
import 'package:flutter/material.dart';
import 'photo.dart';


Widget profileViewWidget(
    {padding,
      photoHeight,
      photoWidth,
      clipRadius,
      photo,
      containerHeight,
      containerWidth,
      child}) {
  return  Stack(
      children: [
   Column(
    children: [
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
    Container(child: PhotoWidget(
      photoLink: photo,)),
    SizedBox(height: 200,)
    ],
  ),
  ],
  );



  //   Padding(
  //   padding: EdgeInsets.all(padding),
  //   child: Container(
  //   decoration: BoxDecoration(
  //   boxShadow: [
  //   BoxShadow(
  //   color: Colors.black54,
  //   blurRadius: 5.0,
  //   spreadRadius: 2.0,
  //   offset: Offset(10.0, 10.0),
  // )
  // ],
  // borderRadius: BorderRadius.circular(clipRadius),
  // ),
  // child: Stack(
  // alignment: Alignment.bottomCenter,
  // children: <Widget>[
  // Container(
  // width: photoWidth,
  // height: photoHeight,
  // child: ClipRRect(
  // borderRadius: BorderRadius.circular(clipRadius),
  // child: PhotoWidget(
  // photoLink: photo,
  // ),
  // ),
  // )
  // ],
  // ),
  //   ),
  // );

}
