part of 'signing_process_cubit.dart';

abstract class SigningProcessState extends Equatable {
  const SigningProcessState();

  @override
  List<Object?> get props => [];
}

class SigningProcessInitialState extends SigningProcessState {
  const SigningProcessInitialState();
}

class FileSelectedState extends SigningProcessState {
  final List<PickedFileModel> files;

  const FileSelectedState({required this.files});

  @override
  List<Object?> get props => [files];
}
