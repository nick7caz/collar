import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String name;
  String gender;
  String interestedIn;
  String photo;
  Timestamp age;
  GeoPoint location;

  User(
      {this.uid,
        this.name,
        this.gender,
        this.interestedIn,
        this.photo,
        this.age,
        this.location});

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      uid: doc['uid'],
      name: doc['name'],
      gender: doc['gender'],
      interestedIn: doc['interestedIn'],
      photo: doc['photo'],
      age: doc['age'],
      location: doc['location']
    );
  }
}