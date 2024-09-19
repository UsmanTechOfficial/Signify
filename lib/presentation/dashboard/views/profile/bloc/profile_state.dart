part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileImageSelectedSuccess extends ProfileState {
  final String imagePath;

  ProfileImageSelectedSuccess(this.imagePath);
}

class ProfileImageSelectedFailure extends ProfileState {
  final String error;

  ProfileImageSelectedFailure(this.error);
}
