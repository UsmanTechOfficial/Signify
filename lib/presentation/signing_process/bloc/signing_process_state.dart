part of 'signing_process_cubit.dart';

sealed class SigningProcessState extends Equatable {
  const SigningProcessState();
}

final class SigningProcessInitial extends SigningProcessState {
  @override
  List<Object> get props => [];
}
