part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckUserStatus extends SplashEvent {}
