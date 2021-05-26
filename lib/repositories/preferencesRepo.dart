import 'dart:io';
import 'package:Collar/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class PreferencesRepo {
  final interestedIn;
  final agePreference;
  final distance;

  PreferencesRepo(this.interestedIn, this.agePreference, this.distance);
}