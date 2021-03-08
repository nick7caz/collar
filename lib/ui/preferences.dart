import 'package:fetch/constants.dart';
import 'package:fetch/widgets/ageSlider.dart';
import 'package:fetch/widgets/locationSlider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';



class Preferences extends StatefulWidget{

  @override
  _PreferencesState createState() => _PreferencesState();
  }

  class _PreferencesState extends State<Preferences> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences', style: GoogleFonts.coiny(fontSize: 40, color: backgroundColor),),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height *0.1),
        child:
      Column(
        children: [
          Container(child: Text('Interested In'),),
          Container(child: Row(children: [Icon(FontAwesomeIcons.male),Icon(FontAwesomeIcons.female), Icon(FontAwesomeIcons.transgender)],),),
          Container(child: Text('age preference'),
          ),
          AgeSlider(),
          Container(child: Text('Distance (miles)'),),
          LocationSlider(),
        ],
      ),
      ),
    );
  }

  }


