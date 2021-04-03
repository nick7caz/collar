part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUserEvent extends SearchEvent {
  final String userId;

  LoadUserEvent({this.userId});

  @override
  List<Object> get props => [userId];
}

class SelectUserEvent extends SearchEvent {
  final String currentUserId, selectedUserId, displayName, photoUrl;

  SelectUserEvent(
      {this.currentUserId, this.displayName, this.photoUrl, this.selectedUserId});

  @override
  List<Object> get props => [currentUserId, selectedUserId, displayName, photoUrl];
}

class PassUserEvent extends SearchEvent {
  final String currentUserId, selectedUserId;

  PassUserEvent(this.currentUserId, this.selectedUserId);

  @override
  List<Object> get props => [currentUserId, selectedUserId];
}