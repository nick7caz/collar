import 'package:Collar/bloc/matches/matches_bloc.dart';
import 'package:Collar/models/user.dart';
import 'package:Collar/repositories/matchesrepo.dart';
import 'package:Collar/widgets/iconWidget.dart';
import 'package:Collar/widgets/matchedWidget.dart';
import 'package:Collar/widgets/pageAnimation.dart';
import 'package:Collar/widgets/profileWidget.dart';
import 'package:Collar/widgets/userGender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

import '../constants.dart';
import 'messaging.dart';

class Matches extends StatefulWidget {
  final String userId;

  const Matches({this.userId});

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  MatchesRepository matchesRepository = MatchesRepository();
  MatchesBloc _matchesBloc;

  int difference;

  getDifference(GeoPoint userLocation) async {
    Position position = await Geolocator.getCurrentPosition();

    double location = await Geolocator.distanceBetween(userLocation.latitude,
        userLocation.longitude, position.latitude, position.longitude);

    difference = location.toInt();
  }

  @override
  void initState() {
    _matchesBloc = MatchesBloc(matchesRepository: matchesRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<MatchesBloc, MatchesState>(
      bloc: _matchesBloc,
      builder: (BuildContext context, MatchesState state) {
        if (state is LoadingState) {
          _matchesBloc.add(LoadListsEvent(userId: widget.userId));
          return CircularProgressIndicator();
        }
        if (state is LoadUserState) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: Container(),
                actions: <Widget>[Container()],
                pinned: true,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Container(
                  child: Text(
                    "Matched",
                    style: TextStyle(color: Color(0xffe67676), fontSize: 20.0),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: state.matchedList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SliverToBoxAdapter(
                      child: Container(),
                    );
                  }
                  if (snapshot.data.documents != null) {
                    final user = snapshot.data.documents;

                    return SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () async {
                              User selectedUser = await matchesRepository
                                  .getUserDetails(user[index].documentID);
                              User currentUser = await matchesRepository
                                  .getUserDetails(widget.userId);
                              await getDifference(selectedUser.location);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: matchedWidget(
                                    photo: selectedUser.photo,
                                    photoHeight: size.height,
                                    padding: size.height * 0.01,
                                    photoWidth: size.width,
                                    clipRadius: size.height * 0.01,
                                    containerWidth: size.width,
                                    containerHeight: size.height * 0.2,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.height * 0.02),
                                      child: ListView(
                                        children: <Widget>[
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              userGender(selectedUser.gender),
                                              Expanded(
                                                child: Text(
                                                  " " +
                                                      selectedUser.displayName +
                                                      ", " +
                                                      (DateTime.now().year -
                                                              selectedUser.age
                                                                  .toDate()
                                                                  .year)
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          size.height * 0.05),
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                difference != null
                                                    ? (difference / 1000)
                                                            .floor()
                                                            .toString() +
                                                        " km away"
                                                    : "away",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    size.height * 0.02),
                                                child: iconWidget(Icons.message,
                                                    () {
                                                  _matchesBloc.add(
                                                    OpenChatEvent(
                                                        currentUser:
                                                            widget.userId,
                                                        selectedUser:
                                                            selectedUser.uid),
                                                  );
                                                  pageTurn(
                                                      Messaging(
                                                          currentUser:
                                                              currentUser,
                                                          selectedUser:
                                                              selectedUser),
                                                      context);
                                                }, size.height * 0.04,
                                                    Colors.white),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: matchedWidget(
                              padding: size.height * 0.01,
                              photo: user[index].data['photoUrl'],
                              photoWidth: size.width * 0.5,
                              photoHeight: size.height * 0.3,
                              clipRadius: size.height * 0.01,
                              containerHeight: size.height * 0.03,
                              containerWidth: size.width * 0.5,
                              child: Text(
                                "  " + user[index].data['displayName'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        childCount: user.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child: Container(),
                    );
                  }
                },
              ),
              SliverAppBar(
                leading: Container(),
                backgroundColor: Colors.transparent,
                actions: <Widget>[Container()],
                pinned: true,
                centerTitle: true,
                title: Text(
                  "Best In Show",
                  style: TextStyle(color: Color(0xffe67676), fontSize: 20.0),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: state.selectedList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SliverToBoxAdapter(
                      child: Container(),
                    );
                  }
                  if (snapshot.data.documents != null) {
                    final user = snapshot.data.documents;
                    return SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () async {
                              User selectedUser = await matchesRepository
                                  .getUserDetails(user[index].documentID);
                              User currentUser = await matchesRepository
                                  .getUserDetails(widget.userId);

                              await getDifference(selectedUser.location);
                              // ignore: missing_return
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: matchedWidget(
                                    padding: size.height * 0.01,
                                    photo: selectedUser.photo,
                                    photoHeight: size.height,
                                    photoWidth: size.width,
                                    clipRadius: size.height * 0.01,
                                    containerWidth: size.width,
                                    containerHeight: size.height * 0.2,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.height * 0.02),
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    userGender(
                                                        selectedUser.gender),
                                                    Expanded(
                                                      child: Text(
                                                        " " +
                                                            selectedUser
                                                                .displayName +
                                                            ", " +
                                                            (DateTime.now()
                                                                        .year -
                                                                    selectedUser
                                                                        .age
                                                                        .toDate()
                                                                        .year)
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                size.height *
                                                                    0.05),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.location_on,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      difference != null
                                                          ? (difference / 1000)
                                                                  .floor()
                                                                  .toString() +
                                                              " km away"
                                                          : "away",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    iconWidget(Icons.clear, () {
                                                      _matchesBloc.add(
                                                        DeleteUserEvent(
                                                            currentUser:
                                                                currentUser.uid,
                                                            selectedUser:
                                                                selectedUser
                                                                    .uid),
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                    }, size.height * 0.08,
                                                        Colors.blue),
                                                    SizedBox(
                                                      width: size.width * 0.05,
                                                    ),
                                                    iconWidget(
                                                        FontAwesomeIcons
                                                            .solidHeart, () {
                                                      _matchesBloc.add(
                                                        AcceptUserEvent(
                                                            selectedUser:
                                                                selectedUser
                                                                    .uid,
                                                            currentUser:
                                                                currentUser.uid,
                                                            currentUserPhotoUrl:
                                                                currentUser
                                                                    .photo,
                                                            currentUserDisplayName:
                                                                currentUser
                                                                    .displayName,
                                                            selectedUserPhotoUrl:
                                                                selectedUser
                                                                    .photo,
                                                            selectedUserDisplayName:
                                                                selectedUser
                                                                    .displayName),
                                                      );
                                                      Navigator.of(context)
                                                          .pop();
                                                    }, size.height * 0.06,
                                                        Colors.red),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: matchedWidget(
                              padding: size.height * 0.01,
                              photo: user[index].data['photoUrl'],
                              photoWidth: size.width * 0.5,
                              photoHeight: size.height * 0.3,
                              clipRadius: size.height * 0.01,
                              containerHeight: size.height * 0.03,
                              containerWidth: size.width * 0.5,
                              child: Text(
                                "  " + user[index].data['displayName'],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        childCount: user.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10, crossAxisCount: 2),
                    );
                  } else
                    return SliverToBoxAdapter(
                      child: Container(),
                    );
                },
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
