part of 'signing_process_cubit.dart';

sealed class SigningProcessState extends Equatable {
  const SigningProcessState();

  @override
  List<Object?> get props => [];
}

final class SigningProcessInitialState extends SigningProcessState {
  const SigningProcessInitialState();

  @override
  List<Object> get props => [];
}

class PdfLoadingState extends SigningProcessState {
  const PdfLoadingState();

  @override
  List<Object?> get props => [];
}

class PdfLoadedState extends SigningProcessState {
  const PdfLoadedState();

  @override
  List<Object?> get props => [];
}

class PdfErrorState extends SigningProcessState {
  const PdfErrorState();

  @override
  List<Object?> get props => [];
}

class OnAddAnotherDocumentState extends SigningProcessState {
  const OnAddAnotherDocumentState();

  @override
  List<Object?> get props => [];
}
