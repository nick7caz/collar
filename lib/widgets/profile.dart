import 'package:fetch/constants.dart';
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
    body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
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
              Container(child: CardProfile(),),
              Container(child: PhotoWidget(
                photoLink: photo,)),
              SizedBox(height: 200,)
            ],
          ),
        ),
        Positioned(bottom: 25, left: 25,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(clipRadius),
                  topRight: Radius.circular(clipRadius),
                  bottomLeft: Radius.circular(clipRadius),
                  bottomRight: Radius.circular(clipRadius),
                )),
            width: containerWidth,
            height: containerHeight*.9,
            child: child,
          ), )
      ],
    ),
  );
}
