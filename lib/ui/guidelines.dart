import 'package:fetch/constants.dart';
import 'package:fetch/repositories/userRepo.dart';
import 'package:fetch/ui/home.dart';
import 'package:fetch/widgets/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';



class GuideLines extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: new Container(),
        centerTitle: true,
        title: Text('Fetch Guidelines', style: GoogleFonts.alatsi(fontSize: 30.0, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
    child: Container(
    child: Column(
        children: [
          SizedBox(height: 20),
          ListTile(
            title: Text('1. Respecting All Users',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 25, fontWeight: FontWeight.bold),),),
          ListTile(
            title: Text('We want EVERYONE that is a part of our community to feel free to express themselves and feel that they’re in a safe place to do so. This means we need to respect all users beliefs, property and interests while using fetch. We will not tolerate any bullying of any of our users. This includes any type of hate speech, profanity towards other users, misogyny, harassment (no intimidation, stalking or threats), abusive and rude behavior.  Let’s all respect each other and treat others the way we wish to be treated. We encourage anyone feeling these to guidelines are not no being followed by fellow Fetch users to please report ',
              textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 15, fontWeight: FontWeight.normal),),),
          ListTile(
            title: Text("2. Let's All Be Ourselves", textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 25, fontWeight: FontWeight.bold),),),
          ListTile(
            title: Text('We all like to show off our best self online but let’s make sure we’re all using our own photos.  No need to impersonate you OR your furry friends. BE YOURSELF. That’ll make your experience here way more fun!  Reported users using unauthorized/deceptive photos will loose access to the platform.', textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 15, fontWeight: FontWeight.normal),),),
          ListTile(
            title: Text('4. NO ILLEGAL ACTIVITY',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 25, fontWeight: FontWeight.bold),), ),
          ListTile(
            title: Text('Any illegal activity will result in being banned from our platform and reported to authorities. ', textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 15, fontWeight: FontWeight.normal),),
          ),
          ListTile(
            title: Text('5. Photo Guidelines',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 25, fontWeight: FontWeight.bold),),),
          RadioListTile(groupValue: false,onChanged: null,dense: true,
            title: Text('No Pornographic material', textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          RadioListTile(groupValue: false,onChanged: null,dense: true,
            title: Text('No Photos in underwear',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          RadioListTile(groupValue: false,onChanged: null,dense: true,
            title: Text('For Men, topless photos ONLY if outdoors; such as the beach or pool',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          RadioListTile(groupValue: false,onChanged: null,dense: true,
            title: Text('For Women, bikini photos ONLY if outdoors; such as the beach or pool',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          RadioListTile(groupValue: false,onChanged: null,dense: true,
            title: Text('No weapons',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          RadioListTile(groupValue: false,onChanged: null,dense: true,
            title: Text('No graphic hunting pictures',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          RadioListTile(groupValue: false,onChanged: null,dense: true,
            title: Text('Any photos with children MUST include an adult and everyone fully clothed',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          RadioListTile(groupValue: false, onChanged: null,dense: true,
            title: Text('YOUR face must be clear and visible in every picture',textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontSize: 14, fontWeight: FontWeight.normal),),),
          ListTile(
            title: Text('6. Not For Solicitors', textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontWeight: FontWeight.bold, fontSize: 25),),),
          ListTile(
            title: Text('Soliciting is not permitted in our community. It not meant for marketing or selling products. Those who do attempt this will lose access to ever using out platform again', textAlign: TextAlign.left, style: GoogleFonts.alatsi(fontWeight: FontWeight.normal, fontSize: 15),),),
          SizedBox(height: 25.0)
        ],
      ),
    )
      ),
     // bottomNavigationBar: RaisedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Tabs()));},
     //     textColor: Color(0xFFf50519),
     //     color: Colors.transparent,
     //     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
     //     child: Text('Back to Fetch')),
    );
  }

}