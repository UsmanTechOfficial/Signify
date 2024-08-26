part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class TogglePasswordVisibility extends SignupEvent {}

class ToggleConfirmPasswordVisibility extends SignupEvent {}

class SignupSubmitted extends SignupEvent {}
