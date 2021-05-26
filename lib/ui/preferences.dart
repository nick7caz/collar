import 'package:Collar/widgets/ageSlider.dart';
import 'package:Collar/widgets/locationSlider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Preferences extends StatefulWidget {
  final agePreference;

  const Preferences({Key key, this.agePreference}) : super(key: key);

  @override
  _PreferencesState createState() => _PreferencesState();
  }

  class _PreferencesState extends State<Preferences> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: backgroundColor, //change your color here
        ),
        elevation: 10,
        centerTitle: true,
        title: Text(
          'Preferences',
          style: GoogleFonts.alatsi(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: backgroundColor),
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
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.05),
          child: Column(
            children: [
              Container(
                child: Text('Interested In', style: GoogleFonts.alatsi(fontSize: 20, color: backgroundColor),),
              ),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.male, size: 40,),
                    Icon(FontAwesomeIcons.female, size: 40,),
                    Icon(FontAwesomeIcons.transgender, size: 40,)
                  ],
              ),
              SizedBox(height: 40,),
              Container(
                child: Text('Age Preference', style: GoogleFonts.alatsi(fontSize: 20, color: backgroundColor),),
              ),
              AgeSlider(),
              Container(
                child: Text('Distance (Miles)', style: GoogleFonts.alatsi(fontSize: 20, color: backgroundColor),),
              ),
              LocationSlider(),
              SizedBox(height: 40,),
              Container(child: RaisedButton(
                onPressed: (){print('changing state');},
                child: Text('Save Changes'),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}


//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: <Widget>[
// genderWidget(FontAwesomeIcons.venus, "Female",
// size * .8, gender, () {
// setState(() {
// gender = "Female";
// });
// }),
// genderWidget(FontAwesomeIcons.mars, "Male",
// size * .8, gender, () {
// setState(() {
// gender = "Male";
// });
// }),
// genderWidget(
// FontAwesomeIcons.transgender,
// "Transgender",
// size * .8,
// gender,
// () {
// setState(
// () {
// gender = "Transgender";
// },
// );
// },
// ),
// ],
// ),