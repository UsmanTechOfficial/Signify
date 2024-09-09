import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signing_process_state.dart';

class SigningProcessCubit extends Cubit<SigningProcessState> {
  List<XFile> files = [];

  SigningProcessCubit() : super(const SigningProcessInitialState());

  Future<void> selectFile() async {
    final XFile? file = await openFile();
    if (file != null) {
      files.add(file);
      emit(const OnAddAnotherDocumentState());
    }
  }
}
