import 'package:fetch/ui/matches.dart';
import 'package:fetch/ui/messages.dart';
import 'package:fetch/ui/profileView.dart';
import 'package:fetch/ui/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BottomBar extends StatelessWidget{
  final userId;
  final userRepository;

  const BottomBar({this.userId, this.userRepository});
  @override

  Widget build(BuildContext context) {
    List<Widget> pages = [
      Search(userId: userId),
      Matches(userId: userId),
      Messages(userId: userId),
      ProfileView(),
    ];
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.paw, size: 30)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.heart, size: 30)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.comments, size: 30)),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user, size: 30)),
      ],
      fixedColor: Color(0xfff50519),
      unselectedItemColor: Color(0xffe67676),
    );
  }
}

