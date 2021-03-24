import 'dart:io';
import 'package:Collar/bloc/authentication/authentication_bloc.dart';
import 'package:Collar/bloc/profile_bloc.dart';
import 'package:Collar/bloc/search_bloc.dart';
import 'package:Collar/models/user.dart';
import 'package:Collar/models/user.dart';
import 'package:Collar/models/user.dart';
import 'package:Collar/repositories/userRepo.dart';
import 'package:Collar/widgets/photo.dart';
import 'package:Collar/widgets/profile.dart';
import 'package:Collar/widgets/userGender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../constants.dart';
import 'gender.dart';

class UserProfile extends StatefulWidget {
  final String userId;


  UserProfile({this.userId});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String gender, interestedIn;
  DateTime age;
  File photo;
  GeoPoint location;
  ProfileBloc _profileBloc;
  User _user;
  UserRepository _userRepository = UserRepository();

  _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    location = GeoPoint(position.latitude, position.longitude);
  }

  // UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    _getLocation();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      listener: (context, state) {
        if (state.isFailure) {
          print("Failed");
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Profile Creation Unsuccessful'),
                    Icon(Icons.error)
                  ],
                ),
              ),
            );
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          // _user = _userRepository.userInfo(userId);
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: backgroundColor,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: size.width,
                    child: profileWidget(photo: _user.photo,
                    photoHeight: size.height *.8,
                    photoWidth: size.width *.8)
                  ),
                  Text("${_user.name}"),
                  // this is where age will go
                  // GestureDetector(
                  //   onTap: () {
                  //     DatePicker.showDatePicker(
                  //       context,
                  //       showTitleActions: true,
                  //       minTime: DateTime(1900, 1, 1),
                  //       maxTime: DateTime(DateTime.now().year - 19, 1, 1),
                  //       onConfirm: (date) {
                  //         setState(() {
                  //           age = date;
                  //         });
                  //         print(age);
                  //       },
                  //     );
                  //   },
                  //   child: Text(
                  //     "Enter Birthday",
                  //     style: TextStyle(
                  //         color: Color(0xffe67676), fontSize: size.width * 0.09),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),
                  //     Column(
                  //       children: [
                  //         userGender(gender)
                  //       ],
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.height * 0.05),
                        ),
                        child: Center(
                            child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              color: Colors.blue),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
