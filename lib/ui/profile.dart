import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fetch/bloc/profile_bloc.dart';
import 'package:fetch/repositories/userRepo.dart';
import 'package:fetch/constants.dart';
import 'package:fetch/widgets/photo.dart';
import 'package:fetch/widgets/profile.dart';
import 'package:fetch/widgets/profileForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatelessWidget {
  final _userRepository;
  final userId;

  Profile({@required UserRepository userRepository, String userId})
      : assert(userRepository != null && userId != null),
        _userRepository = userRepository,
        userId = userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tell Us About Yourself", style: GoogleFonts.alatsi(fontSize: 30,color: Color(0xffe67676)),),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 20,
        shadowColor: Color(0xffe67676),
      ),
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(userRepository: _userRepository),
        child: ProfileForm(
          userRepository: _userRepository,
        ),
      ),
    );
  }
}
