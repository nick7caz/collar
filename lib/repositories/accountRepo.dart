import 'dart:io';
import 'package:Collar/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AccountRepo{
  final privacySetting;
  final deleteUser;
  final pauseUser;
  final subscription;

  AccountRepo(this.privacySetting, this.deleteUser, this.pauseUser, this.subscription);

}
