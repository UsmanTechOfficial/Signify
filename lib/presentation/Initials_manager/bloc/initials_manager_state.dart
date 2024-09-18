part of 'initials_manager_bloc.dart';

sealed class InitialsManagerState extends Equatable {
  const InitialsManagerState();
}

final class InitialsManagerInitial extends InitialsManagerState {
  @override
  List<Object> get props => [];
}
