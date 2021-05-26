import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(10, 3), // 10% of the width, so there are ten blinds.
            colors: <Color>[
              Colors.white,
              Color(0xffe67676),
            ],
          ),
        ),
        child: Center(
          child: Text("Collar",
              style: GoogleFonts.coiny(
                color: backgroundColor,
                fontSize: size.width * 0.2,
              )),
        ),
      ),
    );
  }
}
