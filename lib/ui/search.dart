import 'package:Collar/bloc/search_bloc.dart';
import 'package:Collar/constants.dart';
import 'package:Collar/models/user.dart';
import 'package:Collar/repositories/search.dart';
import 'package:Collar/widgets/iconWidget.dart';
import 'package:Collar/widgets/profileWidget.dart';
import 'package:Collar/widgets/userGender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  final String userId;

  const Search({this.userId});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final SearchRepository _searchRepository = SearchRepository();
  SearchBloc _searchBloc;
  User _user, _currentUser;
  int difference;

  getDifference(GeoPoint userLocation) async {
    Position position = await Geolocator.getCurrentPosition();
    double location = await Geolocator.distanceBetween(userLocation.latitude,
        userLocation.longitude, position.latitude, position.longitude);
    difference = location.toInt();
  }

  @override
  void initState() {
    _searchBloc = SearchBloc(searchRepository: _searchRepository);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<SearchBloc, SearchState>(
      bloc: _searchBloc,
      builder: (context, state) {
        if (state is InitialSearchState) {
          _searchBloc.add(
            LoadUserEvent(userId: widget.userId),
          );
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
            ),
          );
        }
        if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueGrey),
            ),
          );
        }
        if (state is LoadUserState) {
          _user = state.user;
          _currentUser = state.currentUser;

          getDifference(_user.location);
          if (_user.location == null) {
            return Center(
                child: Icon(
              FontAwesomeIcons.paw,
              color: backgroundColor,
              size: 100,
            ));
          } else
            return profileWidget(
              padding: size.height * 0.035,
              photoHeight: size.height * 0.5,
              photoWidth: size.width * 0.95,
              photo: _user.photo,
              bio: _user.bio,
              petName: _user.petName,
              relationGoal: _user.relationGoal,
              petBio: _user.petBio,
              petSize: _user.petSize,
              jobTitle: _user.jobTitle,
              zodiac: _user.zodiac,
              school: _user.school,
              kids: _user.kids,
              clipRadius: size.height * 0.02,
              containerHeight: size.height * 0.3,
              containerWidth: size.width * 0.9,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: <Widget>[
                        userGender(_user.gender),
                        Expanded(
                          child: Text(
                            " " +
                                _user.displayName +
                                " & " +
                                "" +
                                _user.petName,
                            style: GoogleFonts.alatsi(
                                color: Color(0xffe67676),
                                fontSize: size.height * 0.04),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Age: ' +
                          (DateTime.now().year - _user.age.toDate().year)
                              .toString(),
                      style: GoogleFonts.alatsi(
                          color: Color(0xffe67676),
                          fontSize: size.height * 0.03),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mapPin,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          difference != null
                              ? (difference / 1000).floor().toString() +
                                  "km away"
                              : "away",
                          style: GoogleFonts.alatsi(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        iconWidget(FontAwesomeIcons.award, () {},
                            size.height * 0.04, Colors.yellowAccent),
                        iconWidget(FontAwesomeIcons.minusCircle, () {
                          _searchBloc
                              .add(PassUserEvent(widget.userId, _user.uid));
                        }, size.height * 0.06, Colors.blue),
                        iconWidget(FontAwesomeIcons.grinHearts, () {
                          _searchBloc.add(
                            SelectUserEvent(
                                displayName: _currentUser.displayName,
                                photoUrl: _currentUser.photo,
                                currentUserId: widget.userId,
                                selectedUserId: _user.uid),
                          );
                        }, size.height * 0.07, Colors.red),
                        iconWidget(EvaIcons.options2, () {}, size.height * 0.04,
                            Colors.white)
                      ],
                    )
                  ],
                ),
              ),
            );
        } else
          return Container();
      },
    );
  }
}
