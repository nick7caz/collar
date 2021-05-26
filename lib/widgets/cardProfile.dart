import 'package:Collar/constants.dart';
import 'package:Collar/widgets/cardStack.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProfile extends StatelessWidget {
  final name;
  final userId;
  final photo;
  final age;
  final bio;
  final relationGoal;
  final kids;
  final petBio;
  // final petPhoto;
  final petSize;
  final religion;
  final petName;
  final jobTitle;
  final school;
  final zodiac;

  const CardProfile(
      {this.name,
      this.userId,
      this.age,
      this.photo,
      this.bio,
      // this.petPhoto,
      this.relationGoal,
      this.kids,
      this.religion,
      this.petName,
      this.zodiac,
      this.school,
      this.jobTitle,
      this.petSize,
      this.petBio});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(10, 3),
        colors: <Color>[
          Colors.white,
          Color(0xffe67676),
        ],
      )),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(50.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 5),
                      CardStack(
                        photo: photo,
                        // petPhoto: petPhoto,
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Container(
                          child: Text(
                        '$name',
                        style: GoogleFonts.alatsi(fontSize: size.height * 0.035, color: Color(0xffe67676)),
                      )),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.3,
                  alignment: Alignment.center,
                  child: Text(
                    " " + (DateTime.now().year - age.toDate().year).toString(),
                    style: GoogleFonts.alatsi(fontSize: size.height * 0.025, color: Color(0xffe67676)),
                  ),
                ),
                Container(
                    width: size.width * 0.3,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(
                      FontAwesomeIcons.bookOpen,
                      size: size.height * 0.02,
                      color: backgroundColor),
                        Text(
                          '   $bio',
                          style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                        ),
                      ],
                    )),
                Container(
                    child: Text(
                  'This is where the prompt will go',
                  style: GoogleFonts.alatsi(
                      fontSize: 15.0, color: Color(0xffe67676)),
                )),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.briefcase,
                      size: size.height * 0.02,
                      color: backgroundColor,
                    ),
                    Text(
                      '  $jobTitle',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.graduationCap,
                      size: size.height * 0.02,
                      color: backgroundColor,
                    ),
                    Text(
                      '  $school',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.search,
                      size: size.height * 0.02,
                      color: backgroundColor,
                    ),
                    Text(
                      '  $relationGoal',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.star,
                      size: size.height * 0.02,
                      color: backgroundColor,
                    ),
                    Text(
                      '  $zodiac',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.placeOfWorship,
                      size: size.height * 0.02,
                      color: backgroundColor,
                    ),
                    Text(
                      '   $religion',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.babyCarriage,
                      size: size.height * 0.02,
                      color: backgroundColor,
                    ),
                    Text(
                      '  $kids',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pet's Name ",
                        style: GoogleFonts.alatsi(
                            fontSize: size.height * 0.02, color: backgroundColor)),
                    Text(
                      '$petName',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pet's Bio: ",
                        style: GoogleFonts.alatsi(
                            fontSize: size.height * 0.02, color: backgroundColor)),
                    Text(
                      '$petBio',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pet's Size: ",
                        style: GoogleFonts.alatsi(
                            fontSize: size.height * 0.02, color: backgroundColor)),
                    Text(
                      '$petSize',
                      style: GoogleFonts.alatsi(fontSize: size.height * 0.02),
                    )
                  ],
                ),
                SizedBox(height:10),
                Center(child: RaisedButton(onPressed: ()=> {print('edit state')}, focusColor: Colors.red, child: Text('Edit Profile'),)),
                SizedBox(height:50),

              ]),
        )),
      ),
    );
  }
}
