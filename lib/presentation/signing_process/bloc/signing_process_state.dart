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

class MultipleFilesAddedState extends SigningProcessState {
  final List<PickedFileModel> files;

  const MultipleFilesAddedState({required this.files});

  @override
  List<Object?> get props => [files];
}

class PdfThumbnailLoadingState extends SigningProcessState {
  const PdfThumbnailLoadingState();
}

class PdfThumbnailLoadedState extends SigningProcessState {
  final Uint8List pdfThumbnail;

  const PdfThumbnailLoadedState(this.pdfThumbnail);

  @override
  List<Object?> get props => [pdfThumbnail];
}

class PdfThumbnailErrorState extends SigningProcessState {
  final String errorMessage;

  const PdfThumbnailErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}


