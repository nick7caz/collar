part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FirstNameChanged extends ProfileEvent {
  final String firstName;

  FirstNameChanged({@required this.firstName});

  @override
  List<Object> get props => [firstName];
}
class LastNameChanged extends ProfileEvent {
  final String lastName;

  LastNameChanged({@required this.lastName});

  @override
  List<Object> get props => [lastName];
}
class DisplayNameChanged extends ProfileEvent {
  final String displayName;

  DisplayNameChanged({@required this.displayName});

  @override
  List<Object> get props => [displayName];
}
class BioChanged extends ProfileEvent {
  final String bio;

  BioChanged({@required this.bio});

  @override
  List<Object> get props => [bio];
}

class PhotoChanged extends ProfileEvent {
  final File photo;

  PhotoChanged({@required this.photo});

  @override
  List<Object> get props => [photo];
}

class AgeChanged extends ProfileEvent {
  final DateTime age;

  AgeChanged({@required this.age});

  @override
  List<Object> get props => [age];
}

class GenderChanged extends ProfileEvent {
  final String gender;

  GenderChanged({@required this.gender});

  @override
  List<Object> get props => [gender];
}

class InterestedInChanged extends ProfileEvent {
  final String interestedIn;

  InterestedInChanged({@required this.interestedIn});

  @override
  List<Object> get props => [interestedIn];
}

class LocationChanged extends ProfileEvent {
  final GeoPoint location;

  LocationChanged({@required this.location});

  @override
  List<Object> get props => [location];
}

class Submitted extends ProfileEvent {
  final String firstName, lastName, displayName, bio, gender, interestedIn;
  final DateTime age;
  final GeoPoint location;
  final File photo;

  Submitted(
      {@required this.firstName,
        @required this.lastName,
        @required this.displayName,
        @required this.bio,
        @required this.gender,
        @required this.interestedIn,
        @required this.age,
        @required this.location,
        @required this.photo});

  @override
  List<Object> get props => [location, firstName, lastName, displayName, bio, age, gender, interestedIn, photo];
}