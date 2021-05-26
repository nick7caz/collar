import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';


class Account extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: backgroundColor //change your color here
        ),
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Account Settings',
          style: GoogleFonts.alatsi(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: backgroundColor),
        ),
      ),
      body: Container(decoration: BoxDecoration(gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(10, 3),
        colors: <Color>[
          Colors.white,
          Color(0xffe67676),
        ],
      )),
        child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.05),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Text('Privacy Settings', style: GoogleFonts.alatsi(fontSize: 20, color: backgroundColor),),
                  SizedBox(height: 10,),
                  Text('Pause Account', style: GoogleFonts.alatsi(fontSize: 20, color: backgroundColor),),
                  SizedBox(height: 10,),
                  Text('Subscription and Payments', style: GoogleFonts.alatsi(fontSize: 20, color: backgroundColor),),
                  SizedBox(height: 10,),
                  Text('Delete Account', style: GoogleFonts.alatsi(fontSize: 20, color: backgroundColor),),
                  SizedBox(height: 10,),
                  Container(child: RaisedButton(
                    onPressed: (){print('changing state');},
                    child: Text('Save Changes'),
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}