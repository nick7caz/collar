import 'dart:ui';
import 'package:Collar/ui/matches.dart';
import 'package:Collar/ui/messages.dart';
import 'package:Collar/ui/profileView.dart';
import 'package:Collar/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import 'drawer.dart';

class Tabs extends StatelessWidget {
  final userId;
  final userRepository;

  const Tabs({this.userId, this.userRepository});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Search(userId: userId),
      Matches(userId: userId),
      Messages(userId: userId),
      ProfileView(userId: userId),
    ];
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white,
        accentColor: backgroundColor,
        backgroundColor: Colors.transparent,
      ),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            //for an end drawer function
            // actions: [Builder(builder: (context) => IconButton(icon: Icon(FontAwesomeIcons.slidersH),
            // onPressed: ()=> Scaffold.of(context).openDrawer(),
            // ))],
            elevation: 20,
            iconTheme: IconThemeData(color: backgroundColor),
            backgroundColor: Colors.white,
            shadowColor: backgroundColor,
            centerTitle: true,
            title: Text(
              "Collar",
              style: GoogleFonts.coiny(
                  fontSize: 45.0,
                  fontWeight: FontWeight.normal,
                  color: backgroundColor),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Container(
                height: 50.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TabBar(
                      tabs: <Widget>[
                        Tab(icon: Icon(FontAwesomeIcons.paw, size: 30)),
                        Tab(icon: Icon(FontAwesomeIcons.heart, size: 30)),
                        Tab(icon: Icon(FontAwesomeIcons.comments, size: 30)),
                        Tab(icon: Icon(FontAwesomeIcons.user, size: 30)),
                      ],
                      labelColor: backgroundColor,
                      unselectedLabelColor: Color(0xffe67676),
                    )
                  ],
                ),
              ),
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            children: pages,
          ),
        ),
      ),
    );
  }
}
