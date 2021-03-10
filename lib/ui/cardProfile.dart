import 'package:Collar/widgets/cardStack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_stack/image_stack.dart';



class CardProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> images = [];
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
                      CardStack(),
                      Text("Match User Name"),
                    ],
                  ),
                ),
                Container(
                    width: size.width *0.3,
                    alignment: Alignment.center,
                    child: Text('Age', style: GoogleFonts.alatsi(fontSize:30.0,color: Color(0xffe67676)),
                    )
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
