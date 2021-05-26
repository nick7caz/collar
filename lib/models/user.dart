import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String firstName;
  String lastName;
  String displayName;
  String gender;
  String interestedIn;
  String photo;
  String petPhoto;
  String petBio;
  String petName;
  String petSize;
  String school;
  String religion;
  String kids;
  String relationGoal;
  String jobTitle;
  String zodiac;
  String bio;
  Timestamp age;
  GeoPoint location;

  User(
      {this.uid,
      this.firstName,
      this.lastName,
      this.displayName,
      this.gender,
      this.interestedIn,
      this.photo,
      this.petBio,
      this.petName,
      this.petPhoto,
      this.petSize,
      this.school,
      this.relationGoal,
      this.religion,
      this.kids,
      this.jobTitle,
      this.zodiac,
      this.bio,
      this.age,
      this.location});

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
        uid: doc['uid'],
        firstName: doc['firstName'],
        lastName: doc['lastName'],
        displayName: doc['displayName'],
        gender: doc['gender'],
        interestedIn: doc['interestedIn'],
        photo: doc['photo'],
        bio: doc['bio'],
        age: doc['age'],
        location: doc['location'],
        petBio: doc['petBio'],
        petName: doc['petName'],
        petPhoto: doc['petPhoto'],
        petSize: doc['petSize'],
        school: doc['school'],
        relationGoal: doc['relationGoal'],
        religion: doc['religion'],
        kids: doc['kids'],
        jobTitle: doc['jobTitle'],
        zodiac: doc['zodiac']);
  }
}
