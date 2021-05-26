import 'package:Collar/constants.dart';
import 'package:Collar/widgets/photo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

Widget matchedWidget({
  padding,
  photoHeight,
  photoWidth,
  clipRadius,
  photo,
  // bio,
  // petName,
  // petBio,
  // petSize,
  // relationGoal,
  // jobTitle,
  // zodiac,
  // kids,
  // school,
  containerHeight,
  containerWidth,
  child,
  userId,
  userRepository,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(10, 3),
        colors: <Color>[
          Colors.white,
          Color(0xffe67676),
        ],
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: photoWidth ,
                  height: photoHeight ,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(clipRadius),
                    child: PhotoWidget(
                      photoLink: photo,
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       FontAwesomeIcons.bookOpen,
                //       size: 15,
                //       color: backgroundColor,
                //     ),
                //     Text(
                //       '  $bio',
                //       style: GoogleFonts.alatsi(fontSize: 15.0, color: Color(0xffe67676)),
                //     )
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       FontAwesomeIcons.search,
                //       size: 15,
                //       color: backgroundColor,
                //     ),
                //     Text(
                //       '  $relationGoal',
                //       style: GoogleFonts.alatsi(fontSize: 15.0, color: Color(0xffe67676)),
                //     )
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       FontAwesomeIcons.briefcase,
                //       size: 15,
                //       color: backgroundColor,
                //     ),
                //     Text(
                //       '  $jobTitle',
                //       style: GoogleFonts.alatsi(fontSize: 15.0, color: Color(0xffe67676)),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       FontAwesomeIcons.star,
                //       size: 15,
                //       color: backgroundColor,
                //     ),
                //     Text(
                //       '  $zodiac',
                //       style: GoogleFonts.alatsi(fontSize: 15.0, color: Color(0xffe67676)),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       FontAwesomeIcons.graduationCap,
                //       size: 15,
                //       color: backgroundColor,
                //     ),
                //     Text(
                //       '  $school',
                //       style: GoogleFonts.alatsi(fontSize: 15.0, color: Color(0xffe67676)),
                //     ),
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(
                //       FontAwesomeIcons.babyCarriage,
                //       size: 15,
                //       color: backgroundColor,
                //     ),
                //     Text(
                //       '  $kids',
                //       style: GoogleFonts.alatsi(fontSize: 15.0, color: Color(0xffe67676)),
                //     ),
                //   ],
                // ),
                // Column(
                //   children: [
                //     Container(
                //         width: photoWidth,
                //         height: photoHeight,
                //         child: ClipRRect(
                //             borderRadius: BorderRadius.circular(clipRadius),
                //             child: PhotoWidget(
                //               photoLink: photo,
                //             ))),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("Pet's Name: ",
                //             style: GoogleFonts.alatsi(
                //                 fontSize: 15.0, color: Color(0xffe67676))),
                //         Text(
                //           '$petName',
                //           style: GoogleFonts.alatsi(fontSize: 15.0),
                //         )
                //       ],
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("$petName's Bio: ",
                //             style: GoogleFonts.alatsi(
                //                 fontSize: 15.0, color: Color(0xffe67676))),
                //         Text(
                //           '$petBio',
                //           style: GoogleFonts.alatsi(fontSize: 15.0),
                //         )
                //       ],
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("$petName's Size: ",
                //             style: GoogleFonts.alatsi(
                //                 fontSize: 15.0, color: Color(0xffe67676))),
                //         Text(
                //           '$petSize',
                //           style: GoogleFonts.alatsi(fontSize: 15.0),
                //         ),
                //       ],
                //     ),
                 // ],
                // ),
                // SizedBox(
                //   height: 300,
                // )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 25,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(clipRadius),
                    topRight: Radius.circular(clipRadius),
                    bottomLeft: Radius.circular(clipRadius),
                    bottomRight: Radius.circular(clipRadius),
                  )),
              width: containerWidth,
              height: containerHeight * .95,
              child: child,
            ),
          )
        ],
      ),
    ),
  );
}
