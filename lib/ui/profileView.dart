import 'package:Collar/bloc/search_bloc.dart';
import 'package:Collar/models/user.dart';
import 'package:Collar/repositories/search.dart';
import 'package:Collar/ui/cardProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ProfileView extends StatefulWidget {
  final String userId;

  const ProfileView({this.userId});

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final SearchRepository _searchRepository = SearchRepository();
  SearchBloc _searchBloc;
  User _currentUser;
  int difference;

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
        _currentUser = state.currentUser;

        return SingleChildScrollView(
        child:
          Column(
          children: [
            CardProfile(name: _currentUser.displayName, age: _currentUser.age, photo: _currentUser.photo, bio: _currentUser.bio),

          ],
          )
        );
      } else return Container();
    }
    );

  }
  }
