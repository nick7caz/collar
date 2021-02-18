
import 'dart:ui';

import 'package:fetch/ui/matches.dart';
import 'package:fetch/ui/messages.dart';
import 'package:fetch/ui/profileView.dart';
import 'package:fetch/ui/search.dart';
import 'package:fetch/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fetch/ui/guidelines.dart';

import '../constants.dart';

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
      ProfileView(),
    ];
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white,
        accentColor: Color(0xFff50519),
      ),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [Builder(builder: (context) => IconButton(icon: Icon(FontAwesomeIcons.slidersH),
            onPressed: ()=> Scaffold.of(context).openEndDrawer(),
            ))],
            elevation: 10,
            leading: Container(),
            iconTheme: IconThemeData(color: Color(0xffe67676)),
            backgroundColor: Colors.white,
            shadowColor: Color(0xffe67676),
            centerTitle: true,
            title: Text("Fetch",
              style: GoogleFonts.coiny(fontSize: 45.0, fontWeight: FontWeight.normal, color: Color(0xfff50519)),
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
                      labelColor: Color(0xfff50519),
                      unselectedLabelColor: Color(0xffe67676),
                    )
                  ],
                ),
              ),
            ),
          ),
          endDrawer: MyDrawer(),
          body: TabBarView(
            children: pages,
          ),
        ),
      ),
    );
  }
}
