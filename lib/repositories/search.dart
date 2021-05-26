import 'package:Collar/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//fix this one to be best in show
class SearchRepository {
  final Firestore _firestore;

  SearchRepository({Firestore firestore})
      : _firestore = firestore ?? Firestore.instance;

  Future<User> chooseUser(currentUserId, selectedUserId, displayName, photoUrl,
      petPhotoUrl, petSize) async {
    await _firestore
        .collection('users')
        .document(currentUserId)
        .collection('chosenList')
        .document(selectedUserId)
        .setData({});

    await _firestore
        .collection('users')
        .document(selectedUserId)
        .collection('chosenList')
        .document(currentUserId)
        .setData({});

    await _firestore
        .collection('users')
        .document(selectedUserId)
        .collection('selectedList')
        .document(currentUserId)
        .setData({
      'displayName': displayName,
      'photoUrl': photoUrl,
      'petPhotoUrl': petPhotoUrl,
    });
    return getUser(currentUserId);
  }

  passUser(currentUserId, selectedUserId) async {
    await _firestore
        .collection('users')
        .document(selectedUserId)
        .collection('chosenList')
        .document(currentUserId)
        .setData({});

    await _firestore
        .collection('users')
        .document(currentUserId)
        .collection('chosenList')
        .document(selectedUserId)
        .setData({});
    return getUser(currentUserId);
  }

  Future getUserInterests(userId) async {
    User currentUser = User();

    await _firestore.collection('users').document(userId).get().then((user) {
      currentUser.displayName = user['displayName'];
      currentUser.petPhoto = user['petPhotoUrl'];
      currentUser.relationGoal = user['relationGoal'];
      currentUser.bio = user['bio'];
      currentUser.age = user['age'];
      currentUser.photo = user['photoUrl'];
      currentUser.jobTitle = user['jobTitle'];
      currentUser.school = user['school'];
      currentUser.zodiac = user['zodiac'];
      currentUser.religion = user['religion'];
      currentUser.gender = user['gender'];
      currentUser.interestedIn = user['interestedIn'];
      currentUser.petSize = user['petSize'];
      currentUser.petName = user['petName'];
      currentUser.petBio = user['petBio'];
      currentUser.kids = user['kids'];
    });
    return currentUser;
  }

  Future<List> getChosenList(userId) async {
    List<String> chosenList = [];
    await _firestore
        .collection('users')
        .document(userId)
        .collection('chosenList')
        .getDocuments()
        .then((docs) {
      for (var doc in docs.documents) {
        if (docs.documents != null) {
          chosenList.add(doc.documentID);
        }
      }
    });
    return chosenList;
  }

  Future<User> getUser(userId) async {
    User _user = User();
    List<String> chosenList = await getChosenList(userId);
    User currentUser = await getUserInterests(userId);

    await _firestore.collection('users').getDocuments().then((users) {
      for (var user in users.documents) {
        if ((!chosenList.contains(user.documentID)) &&
            (user.documentID != userId) &&
            (currentUser.interestedIn == user['gender']) &&
            (user['interestedIn'] == currentUser.gender)) {
          _user.uid = user.documentID;
          _user.displayName = user['displayName'];
          _user.bio = user['bio'];
          _user.photo = user['photoUrl'];
          _user.petPhoto = user['petPhotoUrl'];
          _user.petName = user['petName'];
          _user.petSize = user['petSize'];
          _user.petBio = user['petBio'];
          _user.jobTitle = user['jobTitle'];
          _user.school = user['school'];
          _user.zodiac = user['zodiac'];
          _user.kids = user['kids'];
          _user.relationGoal = user['relationGoal'];
          _user.religion = user['religion'];
          _user.age = user['age'];
          _user.location = user['location'];
          _user.gender = user['gender'];
          _user.interestedIn = user['interestedIn'];
          break;
        }
      }
    });

    return _user;
  }
}
