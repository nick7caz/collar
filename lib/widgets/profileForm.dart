import 'dart:io';
import 'package:Collar/bloc/authentication/authentication_bloc.dart';
import 'package:Collar/bloc/profile_bloc.dart';
import 'package:Collar/repositories/userRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import '../constants.dart';
import 'gender.dart';

class ProfileForm extends StatefulWidget {
  final UserRepository _userRepository;

  ProfileForm({@required UserRepository userRepository, userId})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _petBioController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> sizes = [
    'Micro',
    'Small',
    'Medium',
    'Large',
    'Very Large'
  ];
  final List<String> signs = [
    'Aquarius',
    'Pisces',
    'Aries',
    'Taurus',
    'Gemini',
    'Cancer',
    'Leo',
    'Virgo',
    'Libra',
    'Scorpio',
    'Sagittarius',
    'Capricorn'
  ];
  final List<String> childs = [
    'Not Yet, but someday',
    'Have one',
    'Have a couple',
    'Never',
    'Undecided'
  ];
  final List<String> goals = [
    'Friends',
    'Casual Dates',
    'More Serious',
    'Long Term',
    "Let's See What Happens",
    'Park Buddies'
  ];
  String gender, _petSize, _zodiac, _kids, _relationGoal, interestedIn;
  DateTime age;
  File photo, petPhoto;
  GeoPoint location, permission;
  ProfileBloc _profileBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isFilled =>
      _firstNameController.text.isNotEmpty &&
      _bioController.text.isNotEmpty &&
      _lastNameController.text.isNotEmpty &&
      _displayNameController.text.isNotEmpty &&
      _jobTitleController.text.isNotEmpty &&
      _schoolController.text.isNotEmpty &&
      _petBioController.text.isNotEmpty &&
      _religionController.text.isNotEmpty &&
      _petNameController.text.isNotEmpty &&
      _petSize != null &&
      _kids != null &&
      _relationGoal != null &&
      _zodiac != null &&
      gender != null &&
      interestedIn != null &&
      photo != null &&
      petPhoto != null &&
      age != null;

  bool isButtonEnabled(ProfileState state) {
    return isFilled && !state.isSubmitting;
  }


  _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    location = GeoPoint(position.latitude, position.longitude);
  }

  _onSubmitted() async {
    await _getLocation();
    _profileBloc.add(Submitted(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        displayName: _displayNameController.text,
        bio: _bioController.text,
        jobTitle: _jobTitleController.text,
        school: _schoolController.text,
        petBio: _petBioController.text,
        religion: _religionController.text,
        petName: _petNameController.text,
        petPhoto: petPhoto,
        kids: _kids,
        petSize: _petSize,
        relationGoal: _relationGoal,
        zodiac: _zodiac,
        age: age,
        location: location,
        gender: gender,
        interestedIn: interestedIn,
        photo: photo));
  }

  @override
  void initState() {
    _getLocation();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _displayNameController.dispose();
    _bioController.dispose();
    _jobTitleController.dispose();
    _schoolController.dispose();
    _religionController.dispose();
    _petBioController.dispose();
    _petNameController.dispose();
    super.dispose();
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
        if (state.isSubmitting) {
          print("Submitting");
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Submitting'),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          print("Success!");
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(gradient: myColor),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: size.width,
                          child: Stack(
                            children: <Widget>[
                              CircleAvatar(
                                radius: size.width * 0.3,
                                backgroundColor: Colors.transparent,
                                child: photo == null
                                    ? GestureDetector(
                                        onTap: () async {
                                          File getPic =
                                              await FilePicker.getFile(
                                                  type: FileType.image);
                                          if (getPic != null) {
                                            setState(() {
                                              photo = getPic;
                                            });
                                          }
                                        },
                                        child: Image.asset(
                                            'assets/images/addPhoto.png'),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          File getPic =
                                              await FilePicker.getFile(
                                                  type: FileType.image);
                                          if (getPic != null) {
                                            setState(() {
                                              photo = getPic;
                                            });
                                          }
                                        },
                                        child: CircleAvatar(
                                          radius: size.width * 0.3,
                                          backgroundImage: FileImage(photo),
                                        ),
                                      ),
                              ),
                              Positioned(
                                top: 50,
                                left: 150.0,
                                child: CircleAvatar(
                                  radius: size.width * 0.3,
                                  backgroundColor: Colors.transparent,
                                  child: petPhoto == null
                                      ? GestureDetector(
                                          onTap: () async {
                                            File getPic =
                                                await FilePicker.getFile(
                                                    type: FileType.image);
                                            if (getPic != null) {
                                              setState(() {
                                                petPhoto = getPic;
                                              });
                                            }
                                          },
                                          child: Image.asset(
                                              'assets/images/addPetPhoto.png'),
                                        )
                                      : GestureDetector(
                                          onTap: () async {
                                            File getPic =
                                                await FilePicker.getFile(
                                                    type: FileType.image);
                                            if (getPic != null) {
                                              setState(() {
                                                petPhoto = getPic;
                                              });
                                            }
                                          },
                                          child: CircleAvatar(
                                            radius: size.width * 0.3,
                                            backgroundImage:
                                                FileImage(petPhoto),
                                          ),
                                        ),
                                ),
                              )
                            ],
                          )),
                      firstNameFieldWidget(
                          _firstNameController, "First Name", size),
                      lastNameFieldWidget(
                          _lastNameController, "Last Name", size),
                      displayNameFieldWidget(
                          _displayNameController, "What Others See", size),
                      jobTitleWidget(
                          _jobTitleController, 'What is your job?', size),
                      schoolWidget(_schoolController,
                          'Where did you goto School?', size),
                      religionWidget(_religionController, 'Religion', size),
                      GestureDetector(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 1, 1),
                            maxTime: DateTime(DateTime.now().year - 19, 1, 1),
                            onConfirm: (date) {
                              setState(() {
                                age = date;
                              });
                              print(age);
                            },
                          );
                        },
                        child: Text(
                          "Enter Birthday",
                          style: TextStyle(
                              color: Color(0xffe67676),
                              fontSize: size.width * 0.08),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.02),
                            child: Text(
                              "You Are",
                              style: TextStyle(
                                  color: Color(0xffe67676),
                                  fontSize: size.width * 0.08),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              genderWidget(FontAwesomeIcons.venus, "Female",
                                  size * .8, gender, () {
                                setState(() {
                                  gender = "Female";
                                });
                              }),
                              genderWidget(FontAwesomeIcons.mars, "Male",
                                  size * .8, gender, () {
                                setState(() {
                                  gender = "Male";
                                });
                              }),
                              genderWidget(
                                FontAwesomeIcons.transgender,
                                "Transgender",
                                size * .8,
                                gender,
                                () {
                                  setState(
                                    () {
                                      gender = "Transgender";
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.02),
                            child: Text(
                              "Interested In",
                              style: TextStyle(
                                  color: Color(0xffe67676),
                                  fontSize: size.width * 0.08),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              genderWidget(FontAwesomeIcons.venus, "Female",
                                  size * .8, interestedIn, () {
                                setState(() {
                                  interestedIn = "Female";
                                });
                              }),
                              genderWidget(FontAwesomeIcons.mars, "Male",
                                  size * .8, interestedIn, () {
                                setState(() {
                                  interestedIn = "Male";
                                });
                              }),
                              genderWidget(
                                FontAwesomeIcons.transgender,
                                "Transgender",
                                size * .8,
                                interestedIn,
                                () {
                                  setState(
                                    () {
                                      interestedIn = "Transgender";
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      bioFieldWidget(_bioController, 'Bio', size),
                      petBioWidget(_petBioController,
                          'A bit about your fur friend', size),
                      petNameWidget(
                          _petNameController, "Your Pet's Name", size),
                      SizedBox(height: 5),
                      DropdownButtonFormField(
                        value: _petSize,
                        hint: Text("What is Your Pet's Size?"),
                        items: sizes.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (val) => setState(() => _petSize = val),
                      ),
                      DropdownButtonFormField(
                        value: _zodiac,
                        hint: Text('What is Your Sign?'),
                        items: signs.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (val) => setState(() => _zodiac = val),
                      ),
                      DropdownButtonFormField(
                        value: _relationGoal,
                        hint: Text('What are You Looking for?'),
                        items: goals.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (val) => setState(() => _relationGoal = val),
                      ),
                      DropdownButtonFormField(
                        value: _kids,
                        hint: Text('Kids?'),
                        items: childs.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (val) => setState(() => _kids = val),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height * 0.02),
                        child: GestureDetector(
                          onTap: () {
                            if (isButtonEnabled(state)) {
                              _onSubmitted();
                            } else {}
                          },
                          child: Container(
                            width: size.width * 0.8,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: isButtonEnabled(state)
                                  ? Colors.white
                                  : Colors.blueGrey,
                              borderRadius:
                                  BorderRadius.circular(size.height * 0.05),
                            ),
                            child: Center(
                                child: Text(
                              "Save",
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
              ));
        },
      ),
    );
  }
}

Widget firstNameFieldWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget lastNameFieldWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget displayNameFieldWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget bioFieldWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget jobTitleWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget religionWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget petBioWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget schoolWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

Widget petNameWidget(controller, text, size) {
  return Padding(
    padding: EdgeInsets.all(size.height * 0.02),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
        labelStyle:
            TextStyle(color: backgroundColor, fontSize: size.height * 0.025),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundColor, width: 1.0),
        ),
      ),
    ),
  );
}

