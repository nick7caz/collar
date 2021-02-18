import 'package:fetch/widgets/myStack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_stack/image_stack.dart';


import '../constants.dart';




class ProfileView extends StatelessWidget {
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
                      color: Color(0xffe67676),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0), bottomLeft: Radius.circular(50.0))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 5),
                      MyStack(),
                      Text("Hi, UserName"),
                    ],
                  ),
                ),
          Container(
              width: size.width *0.3,
              alignment: Alignment.center,
              child: Text('Age: 29', style: GoogleFonts.alatsi(fontSize:30.0,color: Color(0xffe67676)),
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
                    child: Text('Tell Us About You and Your Fur Friend', style: GoogleFonts.alatsi(fontSize:15.0, color: Color(0xffe67676)),)
                )
              ]
          )
      ),
    );
  }
}

