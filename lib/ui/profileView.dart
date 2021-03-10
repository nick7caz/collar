import 'package:Collar/models/user.dart';
import 'package:Collar/repositories/userRepo.dart';
import 'package:Collar/ui/cardProfile.dart';
import 'package:Collar/widgets/cardStack.dart';
import 'package:Collar/widgets/myStack.dart';
import 'package:Collar/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants.dart';



class ProfileView extends StatelessWidget {
  final _userRepository;
  final userId;

  ProfileView({@required UserRepository userRepository, String userId})
      : assert(userRepository != null && userId != null),
        _userRepository = userRepository,
        userId = userId;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
     appBar: AppBar(title: Text('Profile', style: GoogleFonts.coiny(color: backgroundColor, fontSize: 30),
     ),
       elevation: 0,
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           CardProfile(),

         ],
       ),
     ),

   );
  }
}
