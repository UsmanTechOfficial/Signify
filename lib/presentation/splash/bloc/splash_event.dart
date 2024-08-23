import 'package:equatable/equatable.dart';

sealed class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckUserStatus extends SplashEvent {}
