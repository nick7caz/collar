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

class PetPhotoChanged extends ProfileEvent {
  final File petPhoto;

  PetPhotoChanged({@required this.petPhoto});

  @override
  List<Object> get props => [petPhoto];
}

class PetBioChanged extends ProfileEvent {
  final String petBio;

  PetBioChanged({@required this.petBio});

  @override
  List<Object> get props => [petBio];
}

class PetNameChanged extends ProfileEvent {
  final String petName;

  PetNameChanged({@required this.petName});

  @override
  List<Object> get props => [petName];
}

class PetSizeChanged extends ProfileEvent {
  final String petSize;

  PetSizeChanged({@required this.petSize});

  @override
  List<Object> get props => [petSize];
}

class SchoolChanged extends ProfileEvent {
  final String school;

  SchoolChanged({@required this.school});

  @override
  List<Object> get props => [school];
}

class ReligionChanged extends ProfileEvent {
  final String religion;

  ReligionChanged({@required this.religion});

  @override
  List<Object> get props => [religion];
}

class JobTitleChanged extends ProfileEvent {
  final String jobTitle;

  JobTitleChanged({@required this.jobTitle});

  @override
  List<Object> get props => [jobTitle];
}

class KidsChanged extends ProfileEvent {
  final String kids;

  KidsChanged({@required this.kids});

  @override
  List<Object> get props => [kids];
}

class RelationGoalChanged extends ProfileEvent {
  final String relationGoal;

  RelationGoalChanged({@required this.relationGoal});

  @override
  List<Object> get props => [relationGoal];
}

class ZodiacChanged extends ProfileEvent {
  final String zodiac;

  ZodiacChanged({@required this.zodiac});

  @override
  List<Object> get props => [zodiac];
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
  final String firstName,
      lastName,
      displayName,
      bio,
      gender,
      petSize,
      petName,
      petBio,
      religion,
      relationGoal,
      school,
      jobTitle,
      zodiac,
      kids,
      interestedIn;
  final DateTime age;
  final GeoPoint location;
  final File photo, petPhoto;

  Submitted(
      {@required this.firstName,
      @required this.lastName,
      @required this.displayName,
      @required this.bio,
      @required this.gender,
      @required this.interestedIn,
      @required this.petPhoto,
      @required this.petName,
      @required this.petSize,
      @required this.petBio,
      @required this.religion,
      @required this.relationGoal,
      @required this.school,
      @required this.jobTitle,
      @required this.zodiac,
      @required this.kids,
      @required this.age,
      @required this.location,
      @required this.photo});

  @override
  List<Object> get props => [
        location,
        firstName,
        lastName,
        displayName,
        bio,
        age,
        gender,
        interestedIn,
        photo,
        petPhoto,
        petSize,
        petName,
        petBio,
        kids,
        religion,
        relationGoal,
        school,
        jobTitle,
        zodiac
      ];
}
