// import 'dart:typed_data';
//
// import 'package:dyno_sign/domain/utils/utils.dart';
// import 'package:dyno_sign/infrastructure/dal/models/picked_file.model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// part 'signing_process_state.dart';
//
// class SigningProcessCubit extends Cubit<SigningProcessState> {
//   List<PickedFileModel> selectedPdfFileList = [];
//
//   SigningProcessCubit() : super(const SigningProcessInitialState());
//
//   onDocSelection(int index) {
//     emit(AssignFieldSelectedDoc(index: index));
//   }
//
//   void documentPreview() async {
//     emit(DocumentPreviewLoading());
//
//     try {
//       for (var file in selectedPdfFileList) {
//         final firstPage = await PdfSinglePage.get(file.xFile);
//         final imageBytes = firstPage?.bytes;
//
//         if (imageBytes != null) {
//           emit(DocumentPreviewLoaded(imageBytes));
//         }
//       }
//     } catch (e) {
//       emit(DocumentPreviewError(e.toString()));
//     }
//   }
//
//   void addNewFile() async {
//     final selectedFile = await FilePicker.pick();
//
//     if (selectedFile.length == 1) {
//       final model = await FileToModel.convert(selectedFile.first);
//       selectedPdfFileList.add(model);
//     } else {
//       for (var file in selectedFile) {
//         final model = await FileToModel.convert(file);
//         selectedPdfFileList.add(model);
//       }
//     }
//
//     emit(const FileSelectedState());
//   }
//
//   void removeFile(int index) {
//     selectedPdfFileList.removeAt(index);
//     emit(const FileSelectedState());
//   }
//
//   @override
//   Future<void> close() {
//     selectedPdfFileList.clear();
//     return super.close();
//   }
// }
