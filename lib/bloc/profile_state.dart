part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final bool isPhotoEmpty;
  final bool isFirstNameEmpty;
  final bool isLastNameEmpty;
  final bool isDisplayNameEmpty;
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
          isFirstNameEmpty &&
          isLastNameEmpty &&
          isDisplayNameEmpty &&
          isAgeEmpty &&
          isGenderEmpty &&
          isInterestedInEmpty &&
          isBioEmpty;

  ProfileState({
    @required this.isPhotoEmpty,
    @required this.isFirstNameEmpty,
    @required this.isLastNameEmpty,
    @required this.isDisplayNameEmpty,
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
      isFirstNameEmpty: false,
      isLastNameEmpty: false,
      isDisplayNameEmpty: false,
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
      isFirstNameEmpty: false,
      isLastNameEmpty: false,
      isDisplayNameEmpty: false,
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
      isFirstNameEmpty: false,
      isLastNameEmpty: false,
      isDisplayNameEmpty: false,
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
      isFirstNameEmpty: false,
      isLastNameEmpty: false,
      isDisplayNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false,
      isBioEmpty: false,
    );
  }


  ProfileState update({
    bool isPhotoEmpty,
    bool isFirstNameEmpty,
    bool isLastNameEmpty,
    bool isDisplayNameEmpty,
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
      isFirstNameEmpty: isFirstNameEmpty,
      isAgeEmpty: isAgeEmpty,
      isGenderEmpty: isGenderEmpty,
      isInterestedInEmpty: isInterestedInEmpty,
      isLocationEmpty: isLocationEmpty,
        isBioEmpty: isBioEmpty,
    );
  }

  ProfileState copyWith({
    bool isPhotoEmpty,
    bool isFirstNameEmpty,
    bool isLastNameEmpty,
    bool isDisplayNameEmpty,
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
      isFirstNameEmpty: isFirstNameEmpty ?? this.isFirstNameEmpty,
      isLastNameEmpty: isLastNameEmpty ?? this.isLastNameEmpty,
      isDisplayNameEmpty: isDisplayNameEmpty?? this.isDisplayNameEmpty,
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