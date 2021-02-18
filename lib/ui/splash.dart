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
        child: Center(
          child: Text(
            "Fetch",
            style: GoogleFonts.coiny(
                color: Color(0xFFf50519),
                fontSize: size.width * 0.2,)
          ),
        ),
      ),
    );
  }
}