import 'package:Collar/ui/account.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Collar/bloc/authentication/authentication_bloc.dart';
import 'package:Collar/ui/guidelines.dart';
import 'package:Collar/ui/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:footer/footer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class MyDrawer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Collar',
              textAlign: TextAlign.center,
              style: GoogleFonts.coiny(
                  fontSize: 75.0,
                  fontWeight: FontWeight.normal,
                  color: backgroundColor),
            ),
          ),

          SizedBox(height: 40),
          ListTile(
            leading: Icon(FontAwesomeIcons.wrench, color: Color(0xffe67676)),
            title: Text('Preferences',
                style: GoogleFonts.alatsi(
                    fontSize: 20.0, color: Color(0xffe67676))),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Preferences()));
            },
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(FontAwesomeIcons.idBadge, color: Color(0xffe67676)),
            title: Text(
              'Account',
              style:
                  GoogleFonts.alatsi(fontSize: 20.0, color: Color(0xffe67676)),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Account()));
            },
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading:
                Icon(FontAwesomeIcons.checkDouble, color: Color(0xffe67676)),
            title: Text(
              'Guidelines',
              style:
                  GoogleFonts.alatsi(fontSize: 20.0, color: Color(0xffe67676)),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GuideLines()));
            },
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(FontAwesomeIcons.bone, color: Color(0xffe67676)),
            title: Text(
              'Interested in Adoption?',
              style:
                  GoogleFonts.alatsi(fontSize: 20.0, color: Color(0xffe67676)),
            ),
            onTap: () {
              launch('https://www.petfinder.com');
            },
          ),
          SizedBox(height: size.height * 0.2),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              },
            ),
          ),
          Footer(child: Text('Fetch Vers. 1.0'))
        ],
      ),
    );
  }
}

