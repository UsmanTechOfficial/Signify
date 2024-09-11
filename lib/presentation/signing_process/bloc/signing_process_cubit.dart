import 'package:dyno_sign/domain/utils/utils.dart';
import 'package:dyno_sign/infrastructure/dal/models/picked_file.model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signing_process_state.dart';

class SigningProcessCubit extends Cubit<SigningProcessState> {
  List<PickedFileModel> pickedFiles = [];

  SigningProcessCubit() : super(const SigningProcessInitialState());

  void addNewFile() async {
    final selectedFile = await FilePicker.pick();

    if (selectedFile.length == 1) {
      final model = await FileToModel.convert(selectedFile.first);
      pickedFiles.add(model);
    } else {
      for (var file in selectedFile) {
        final model = await FileToModel.convert(file);
        pickedFiles.add(model);
      }
    }

    emit(FileSelectedState(files: List.unmodifiable(pickedFiles)));
  }

  void removeFile(int index) {
    pickedFiles.removeAt(index);
    emit(FileSelectedState(files: List.unmodifiable(pickedFiles)));
  }
}
