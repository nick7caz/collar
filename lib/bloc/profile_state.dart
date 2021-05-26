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
  final bool isPetPhotoEmpty;
  final bool isPetBioEmpty;
  final bool isPetNameEmpty;
  final bool isPetSizeEmpty;
  final bool isSchoolEmpty;
  final bool isReligionEmpty;
  final bool isRelationGoalEmpty;
  final bool isJobTitleEmpty;
  final bool isKidsEmpty;
  final bool isZodiacEmpty;

  bool get isFormValid =>
      isPhotoEmpty &&
      isFirstNameEmpty &&
      isLastNameEmpty &&
      isDisplayNameEmpty &&
      isAgeEmpty &&
      isGenderEmpty &&
      isInterestedInEmpty &&
      isPetPhotoEmpty &&
      isPetBioEmpty &&
      isPetNameEmpty &&
      isPetSizeEmpty &&
      isSchoolEmpty &&
      isReligionEmpty &&
      isRelationGoalEmpty &&
      isJobTitleEmpty &&
      isKidsEmpty &&
      isZodiacEmpty &&
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
    @required this.isPetPhotoEmpty,
    @required this.isPetBioEmpty,
    @required this.isPetNameEmpty,
    @required this.isPetSizeEmpty,
    @required this.isSchoolEmpty,
    @required this.isReligionEmpty,
    @required this.isRelationGoalEmpty,
    @required this.isJobTitleEmpty,
    @required this.isKidsEmpty,
    @required this.isZodiacEmpty,
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
      isPetPhotoEmpty: false,
      isPetNameEmpty: false,
      isPetBioEmpty: false,
      isPetSizeEmpty: false,
      isSchoolEmpty: false,
      isReligionEmpty: false,
      isRelationGoalEmpty: false,
      isJobTitleEmpty: false,
      isKidsEmpty: false,
      isZodiacEmpty: false,
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
      isPetPhotoEmpty: false,
      isPetBioEmpty: false,
      isPetNameEmpty: false,
      isPetSizeEmpty: false,
      isSchoolEmpty: false,
      isReligionEmpty: false,
      isRelationGoalEmpty: false,
      isJobTitleEmpty: false,
      isKidsEmpty: false,
      isZodiacEmpty: false,
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
      isPetPhotoEmpty: false,
      isPetBioEmpty: false,
      isPetNameEmpty: false,
      isPetSizeEmpty: false,
      isSchoolEmpty: false,
      isReligionEmpty: false,
      isRelationGoalEmpty: false,
      isJobTitleEmpty: false,
      isKidsEmpty: false,
      isZodiacEmpty: false,
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
      isPetPhotoEmpty: false,
      isPetNameEmpty: false,
      isPetBioEmpty: false,
      isPetSizeEmpty: false,
      isSchoolEmpty: false,
      isReligionEmpty: false,
      isRelationGoalEmpty: false,
      isJobTitleEmpty: false,
      isKidsEmpty: false,
      isZodiacEmpty: false,
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
    bool isPetPhotoEmpty,
    bool isPetBioEmpty,
    bool isPetNameEmpty,
    bool isPetSizeEmpty,
    bool isSchoolEmpty,
    bool isReligionEmpty,
    bool isRelationGoalEmpty,
    bool isJobTitleEmpty,
    bool isKidsEmpty,
    bool isZodiacEmpty,
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
      isPetPhotoEmpty: isPetPhotoEmpty,
      isPetBioEmpty: isPetBioEmpty,
      isPetNameEmpty: isPetNameEmpty,
      isPetSizeEmpty: isPetSizeEmpty,
      isSchoolEmpty: isSchoolEmpty,
      isReligionEmpty: isReligionEmpty,
      isRelationGoalEmpty: isRelationGoalEmpty,
      isJobTitleEmpty: isJobTitleEmpty,
      isKidsEmpty: isKidsEmpty,
      isZodiacEmpty: isZodiacEmpty,
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
    bool isPetPhotoEmpty,
    bool isPetBioEmpty,
    bool isPetNameEmpty,
    bool isPetSizeEmpty,
    bool isSchoolEmpty,
    bool isReligionEmpty,
    bool isRelationGoalEmpty,
    bool isJobTitleEmpty,
    bool isKidsEmpty,
    bool isZodiacEmpty,
  }) {
    return ProfileState(
      isPhotoEmpty: isPhotoEmpty ?? this.isPhotoEmpty,
      isFirstNameEmpty: isFirstNameEmpty ?? this.isFirstNameEmpty,
      isLastNameEmpty: isLastNameEmpty ?? this.isLastNameEmpty,
      isDisplayNameEmpty: isDisplayNameEmpty ?? this.isDisplayNameEmpty,
      isBioEmpty: isBioEmpty ?? this.isBioEmpty,
      isLocationEmpty: isLocationEmpty ?? this.isLocationEmpty,
      isInterestedInEmpty: isInterestedInEmpty ?? this.isInterestedInEmpty,
      isGenderEmpty: isGenderEmpty ?? this.isGenderEmpty,
      isAgeEmpty: isAgeEmpty ?? this.isAgeEmpty,
      isPetPhotoEmpty: isPetPhotoEmpty ?? this.isPetPhotoEmpty,
      isPetBioEmpty: isPetBioEmpty ?? this.isPetBioEmpty,
      isPetNameEmpty: isPetNameEmpty ?? this.isPetNameEmpty,
      isPetSizeEmpty: isPetSizeEmpty ?? this.isPetSizeEmpty,
      isSchoolEmpty: isSchoolEmpty ?? this.isSchoolEmpty,
      isReligionEmpty: isReligionEmpty ?? this.isReligionEmpty,
      isRelationGoalEmpty: isRelationGoalEmpty ?? this.isRelationGoalEmpty,
      isJobTitleEmpty: isJobTitleEmpty ?? this.isJobTitleEmpty,
      isKidsEmpty: isKidsEmpty ?? this.isKidsEmpty,
      isZodiacEmpty: isZodiacEmpty ?? this.isZodiacEmpty,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}

class LoadProfileState extends ProfileState {
  final Stream<QuerySnapshot> age;
  final Stream<QuerySnapshot> photoUrl;

  LoadProfileState(this.age, this.photoUrl);

  @override
  List<Object> get props => [age, photoUrl];
}
