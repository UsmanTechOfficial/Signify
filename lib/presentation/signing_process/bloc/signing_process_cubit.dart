import 'dart:io';

import 'package:dyno_sign/infrastructure/dal/models/picked_file.model.dart';
import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

part 'signing_process_state.dart';

class SigningProcessCubit extends Cubit<SigningProcessState> {
  List<PickedFileModel> pickedFiles = [];

  SigningProcessCubit() : super(const SigningProcessInitialState());

  Future<void> generatePdfThumbnail() async {
    try {
      emit(const PdfThumbnailLoadingState());

      final Uint8List pdfBytes = pickedFiles.first.bytes;
      final tempDir = await getTemporaryDirectory();
      final tempPdfPath = '${tempDir.path}/temp_pdf.pdf';
      final pdfFile = File(tempPdfPath);
      await pdfFile.writeAsBytes(pdfBytes);

      final pdfDocument = await PdfDocument.openFile(tempPdfPath);
      final page = await pdfDocument.getPage(1);

      final pdfPageImage = await page.render(
        width: page.width,
        height: page.height,
      );

      emit(PdfThumbnailLoadedState(pdfPageImage!.bytes));
    } catch (e) {
      emit(PdfThumbnailErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> pickFiles({bool allowMultiple = false}) async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'PDFs',
      extensions: ['pdf'],
    );

    final List<XFile> selectedFiles = await openFiles(
      acceptedTypeGroups: [typeGroup],
    );

    if (selectedFiles.isNotEmpty) {
      for (var file in selectedFiles) {
        final model = PickedFileModel(
          name: file.name,
          date: await file.lastModified(),
          bytes: await file.readAsBytes(),
        );
        pickedFiles.add(model);
      }

      emit(FileSelectedState(files: List.unmodifiable(pickedFiles)));

      if (allowMultiple) {
        emit(MultipleFilesAddedState(files: List.unmodifiable(pickedFiles)));
      }
    }
  }

  void removeFile(int index) {
    pickedFiles.removeAt(index);
    emit(FileSelectedState(files: List.unmodifiable(pickedFiles)));
  }

}
