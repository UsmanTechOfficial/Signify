part of 'signing_process_cubit.dart';

sealed class SigningProcessState extends Equatable {
  const SigningProcessState();

  @override
  List<Object?> get props => [];
}

class SigningProcessInitialState extends SigningProcessState {
  const SigningProcessInitialState();
}

class FileSelectedState extends SigningProcessState {
  const FileSelectedState();
}

class DocumentPreviewLoading extends SigningProcessState {
  @override
  List<Object?> get props => [];
}

class DocumentPreviewLoaded extends SigningProcessState {
  final Uint8List imageBytes;

  const DocumentPreviewLoaded(this.imageBytes);

  @override
  List<Object?> get props => [imageBytes];
}

class DocumentPreviewError extends SigningProcessState {
  final String msg;

  const DocumentPreviewError(this.msg);

  @override
  List<Object?> get props => [msg];
}

class AssignFieldSelectedDoc extends SigningProcessState {
  final int index;

  const AssignFieldSelectedDoc({this.index = 0});

  @override
  List<Object?> get props => [index];
}
