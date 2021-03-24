import 'package:Collar/widgets/cardStack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CardProfile extends StatelessWidget {
final name;
final userId;
final photo;
final age;

  const CardProfile({this.name, this.userId, this.age, this.photo});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
          color: Colors.white,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0), bottomLeft: Radius.circular(50.0))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 5),
                      CardStack(photo: photo),
                      Text('$name'),
                    ],
                  ),
                ),
                Container(
                    width: size.width *0.3,
                    alignment: Alignment.center,
                    child: Text('age')
                ),
                Container(
                    decoration: BoxDecoration(border: Border.all(width: 2, color: Color(0xffe67676)), borderRadius: BorderRadius.all(Radius.circular(50))),
                    width: size.width *0.3,
                    alignment: Alignment.center,
                    child: Text('Bio', style: GoogleFonts.alatsi(fontSize:30.0, color: Color(0xffe67676)),)
                ),
                Container(
                    width: size.width *0.3,
                    child: Text('This is me and my fur friend, we do a lot of cool stuff together.', style: GoogleFonts.alatsi(fontSize:15.0, color: Color(0xffe67676)),)
                ),
      Container(
          width: size.width *0.3,
          child: Text('Looking for...', style: GoogleFonts.alatsi(fontSize:15.0, color: Color(0xffe67676)))),
      Container(
          width: size.width *0.3,
          child: Text('Catch us out doing...', style: GoogleFonts.alatsi(fontSize:15.0, color: Color(0xffe67676))))
              ]
          )
      ),
    );
  }
}
