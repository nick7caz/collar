part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final bool isPhotoEmpty;
  final bool isNameEmpty;
  final bool isAgeEmpty;
  final bool isGenderEmpty;
  final bool isInterestedInEmpty;
  final bool isLocationEmpty;
  final bool isFailure;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isBioEmpty;

  bool get isFormValid =>
      isPhotoEmpty &&
          isNameEmpty &&
          isAgeEmpty &&
          isGenderEmpty &&
          isInterestedInEmpty &&
          isBioEmpty;

  ProfileState({
    @required this.isPhotoEmpty,
    @required this.isNameEmpty,
    @required this.isBioEmpty,
    @required this.isAgeEmpty,
    @required this.isGenderEmpty,
    @required this.isInterestedInEmpty,
    @required this.isLocationEmpty,
    @required this.isFailure,
    @required this.isSubmitting,
    @required this.isSuccess,
  });

  factory ProfileState.empty() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: false,
      isSubmitting: false,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false,
        isBioEmpty: false,
    );
  }

  factory ProfileState.loading() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: false,
      isSubmitting: true,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false,
        isBioEmpty: false,
    );
  }

  factory ProfileState.failure() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: true,
      isSuccess: false,
      isSubmitting: false,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false,
        isBioEmpty: false,
    );
  }

  factory ProfileState.success() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: true,
      isSubmitting: false,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false,
      isBioEmpty: false,
    );
  }


  ProfileState update({
    bool isPhotoEmpty,
    bool isNameEmpty,
    bool isAgeEmpty,
    bool isGenderEmpty,
    bool isInterestedInEmpty,
    bool isLocationEmpty,
    bool isBioEmpty,
  }) {
    return copyWith(
      isFailure: false,
      isSuccess: false,
      isSubmitting: false,
      isPhotoEmpty: isPhotoEmpty,
      isNameEmpty: isNameEmpty,
      isAgeEmpty: isAgeEmpty,
      isGenderEmpty: isGenderEmpty,
      isInterestedInEmpty: isInterestedInEmpty,
      isLocationEmpty: isLocationEmpty,
        isBioEmpty: isBioEmpty,
    );
  }

  ProfileState copyWith({
    bool isPhotoEmpty,
    bool isNameEmpty,
    bool isAgeEmpty,
    bool isGenderEmpty,
    bool isInterestedInEmpty,
    bool isLocationEmpty,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
    bool isBioEmpty,
  }) {
    return ProfileState(
      isPhotoEmpty: isPhotoEmpty ?? this.isPhotoEmpty,
      isNameEmpty: isNameEmpty ?? this.isNameEmpty,
      isBioEmpty: isBioEmpty ?? this.isBioEmpty,
      isLocationEmpty: isLocationEmpty ?? this.isLocationEmpty,
      isInterestedInEmpty: isInterestedInEmpty ?? this.isInterestedInEmpty,
      isGenderEmpty: isGenderEmpty ?? this.isGenderEmpty,
      isAgeEmpty: isAgeEmpty ?? this.isAgeEmpty,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}

class LoadProfileState extends ProfileState{
  final Stream<QuerySnapshot> age;
  final Stream<QuerySnapshot> photoUrl;

  LoadProfileState(this.age, this.photoUrl);

  @override
  List<Object> get props => [age, photoUrl];
}