import 'dart:io';
import 'package:Collar/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final Firestore _firestore;

  UserRepository({FirebaseAuth firebaseAuth, Firestore firestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? Firestore.instance;

  Future<void> signInWithEmail(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<bool> isFirstTime(String userId) async {
    bool exist;
    await Firestore.instance
        .collection('users')
        .document(userId)
        .get()
        .then((user) {
      exist = user.exists;
    });

    return exist;
  }

  Future<void> signUpWithEmail(String email, String password) async {
    print(_firebaseAuth);
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  //delete user

  //pause user account

  //user is paying

  //user has free account



  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  Future<User> userInfo(userId) async {
    User _user = User();

    await _firestore.collection('users').document(userId).get().then((user) {
      _user.uid = user.documentID;
      _user.firstName = user['firstName'];
      _user.lastName = user['lastName'];
      _user.displayName = user['displayName'];
      _user.bio = user['bio'];
      _user.photo = user['photoUrl'];
      _user.age = user['age'];
      _user.location = user['location'];
      _user.gender = user['gender'];
      _user.interestedIn = user['interestedIn'];
      _user.petPhoto = user['petPhotoUrl'];
      _user.petBio = user['petBio'];
      _user.petName = user['petName'];
      _user.petSize = user['petSize'];
      _user.school = user['school'];
      _user.religion = user['religion'];
      _user.relationGoal = user['relationGoal'];
      _user.jobTitle = user['jobTitle'];
      _user.kids = user['kids'];
      _user.zodiac = user['zodiac'];
    });
    return _user;
  }
//profile edit

 //Future<void>profileEdit();

  //profile setup
  Future<void> profileSetup(
      File photo,
      String userId,
      String firstName,
      String lastName,
      String displayName,
      String bio,
      String gender,
      String interestedIn,
      DateTime age,
      File petPhoto,
      String petBio,
      String petName,
      String petSize,
      String school,
      String religion,
      String relationGoal,
      String kids,
      String jobTitle,
      String zodiac,
      GeoPoint location) async {
    StorageUploadTask storageUploadTask;
    storageUploadTask = FirebaseStorage.instance
        .ref()
        .child("userPhotos/$photo, $petPhoto")
        .child(userId)
        .child(userId)
        .putFile(photo);

    return await storageUploadTask.onComplete.then((ref) async {
      await ref.ref.getDownloadURL().then((url) async {
        await ref.ref.getDownloadURL().then((url1) async {
          await _firestore.collection('users').document(userId).setData({
            'uid': userId,
            'photoUrl': url,
            'firstName': firstName,
            'lastName': lastName,
            'displayName': displayName,
            'bio': bio,
            "location": location,
            'gender': gender,
            'interestedIn': interestedIn,
            'age': age,
            'petPhotoUrl': url1,
            'petBio': petBio,
            'petName': petName,
            'petSize': petSize,
            'school': school,
            'religion': religion,
            'relationGoal': relationGoal,
            'kids': kids,
            'jobTitle': jobTitle,
            'zodiac': zodiac,
          });
        });
      });
    });
  }
}
