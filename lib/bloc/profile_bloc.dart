import 'dart:async';
import 'dart:io';
import 'package:Collar/repositories/userRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter/cupertino.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepository _userRepository;

  ProfileBloc({@required UserRepository userRepository, userId})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ProfileState get initialState => ProfileState.empty();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FirstNameChanged) {
      yield* _mapFirstNameChangedToState(event.firstName);
    } else if (event is LastNameChanged) {
      yield* _mapLastNameChangedToState(event.lastName);
    } else if (event is DisplayNameChanged) {
      yield* _mapDisplayNameChangedToState(event.displayName);
    } else if (event is AgeChanged) {
      yield* _mapAgeChangedToState(event.age);
    } else if (event is GenderChanged) {
      yield* _mapGenderChangedToState(event.gender);
    } else if (event is InterestedInChanged) {
      yield* _mapInterestedInChangedToState(event.interestedIn);
    } else if (event is LocationChanged) {
      yield* _mapLocationChangedToState(event.location);
    } else if (event is PhotoChanged) {
      yield* _mapPhotoChangedToState(event.photo);
    } else if (event is BioChanged) {
      yield* _mapBioChangedToState(event.bio);
    } else if (event is PetPhotoChanged) {
      yield* _mapPetPhotoChangedToState(event.petPhoto);
    } else if (event is PetBioChanged) {
      yield* _mapPetBioChangedToState(event.petBio);
    } else if (event is PetNameChanged) {
      yield* _mapPetNameChangedToState(event.petName);
    } else if (event is PetSizeChanged) {
      yield* _mapPetSizeChangedToState(event.petSize);
    } else if (event is SchoolChanged) {
      yield* _mapSchoolChangedToState(event.school);
    } else if (event is ReligionChanged) {
      yield* _mapReligionChangedToState(event.religion);
    } else if (event is KidsChanged) {
      yield* _mapKidsChangedToState(event.kids);
    } else if (event is RelationGoalChanged) {
      yield* _mapRelationGoalChangedToState(event.relationGoal);
    } else if (event is JobTitleChanged) {
      yield* _mapJobTitleChangedToState(event.jobTitle);
    } else if (event is ZodiacChanged) {
      yield* _mapZodiacChangedToState(event.zodiac);
    }
    if (event is Submitted) {
      final uid = await _userRepository.getUser();
      yield* _mapSubmittedToState(
          photo: event.photo,
          bio: event.bio,
          firstName: event.firstName,
          lastName: event.lastName,
          displayName: event.displayName,
          gender: event.gender,
          userId: uid,
          age: event.age,
          petPhoto: event.petPhoto,
          petName: event.petName,
          petBio: event.petBio,
          petSize: event.petSize,
          school: event.school,
          religion: event.religion,
          relationGoal: event.relationGoal,
          kids: event.kids,
          jobTitle: event.jobTitle,
          zodiac: event.zodiac,
          location: event.location,
          interestedIn: event.interestedIn);
    }
  }

  Stream<ProfileState> _mapFirstNameChangedToState(String firstName) async* {
    yield state.update(
      isFirstNameEmpty: firstName == null,
    );
  }

  Stream<ProfileState> _mapLastNameChangedToState(String lastName) async* {
    yield state.update(
      isLastNameEmpty: lastName == null,
    );
  }

  Stream<ProfileState> _mapDisplayNameChangedToState(
      String displayName) async* {
    yield state.update(
      isDisplayNameEmpty: displayName == null,
    );
  }

  Stream<ProfileState> _mapBioChangedToState(String bio) async* {
    yield state.update(
      isBioEmpty: bio == null,
    );
  }

  Stream<ProfileState> _mapPhotoChangedToState(File photo) async* {
    yield state.update(
      isPhotoEmpty: photo == null,
    );
  }

  Stream<ProfileState> _mapAgeChangedToState(DateTime age) async* {
    yield state.update(
      isAgeEmpty: age == null,
    );
  }

  Stream<ProfileState> _mapGenderChangedToState(String gender) async* {
    yield state.update(
      isGenderEmpty: gender == null,
    );
  }

  Stream<ProfileState> _mapPetPhotoChangedToState(File petPhoto) async* {
    yield state.update(
      isPetPhotoEmpty: petPhoto == null,
    );
  }

  Stream<ProfileState> _mapPetBioChangedToState(String petBio) async* {
    yield state.update(
      isPetBioEmpty: petBio == null,
    );
  }

  Stream<ProfileState> _mapPetNameChangedToState(String petName) async* {
    yield state.update(
      isPetNameEmpty: petName == null,
    );
  }

  Stream<ProfileState> _mapPetSizeChangedToState(String petSize) async* {
    yield state.update(
      isPetSizeEmpty: petSize == null,
    );
  }

  Stream<ProfileState> _mapSchoolChangedToState(String school) async* {
    yield state.update(
      isSchoolEmpty: school == null,
    );
  }

  Stream<ProfileState> _mapReligionChangedToState(String religion) async* {
    yield state.update(
      isReligionEmpty: religion == null,
    );
  }

  Stream<ProfileState> _mapKidsChangedToState(String kids) async* {
    yield state.update(
      isKidsEmpty: kids == null,
    );
  }

  Stream<ProfileState> _mapJobTitleChangedToState(String jobTitle) async* {
    yield state.update(
      isJobTitleEmpty: jobTitle == null,
    );
  }

  Stream<ProfileState> _mapRelationGoalChangedToState(
      String relationGoal) async* {
    yield state.update(
      isRelationGoalEmpty: relationGoal == null,
    );
  }

  Stream<ProfileState> _mapZodiacChangedToState(String zodiac) async* {
    yield state.update(
      isZodiacEmpty: zodiac == null,
    );
  }

  Stream<ProfileState> _mapInterestedInChangedToState(
      String interestedIn) async* {
    yield state.update(
      isInterestedInEmpty: interestedIn == null,
    );
  }

  Stream<ProfileState> _mapLocationChangedToState(GeoPoint location) async* {
    yield state.update(
      isLocationEmpty: location == null,
    );
  }

  Stream<ProfileState> _mapSubmittedToState({
    File photo,
    File petPhoto,
    String gender,
    String firstName,
    String lastName,
    String displayName,
    String bio,
    String userId,
    String petBio,
    String petName,
    String petSize,
    String school,
    String religion,
    String kids,
    String relationGoal,
    String jobTitle,
    String zodiac,
    String interestedIn,
    DateTime age,
    GeoPoint location,
  }) async* {
    yield ProfileState.loading();
    try {
      await _userRepository.profileSetup(
          photo,
          userId,
          firstName,
          lastName,
          displayName,
          bio,
          gender,
          interestedIn,
          age,
          petPhoto,
          petSize,
          petBio,
          petName,
          school,
          religion,
          relationGoal,
          kids,
          jobTitle,
          zodiac,
          location);
      yield ProfileState.success();
    } catch (_) {
      yield ProfileState.failure();
    }
  }
}
