import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

part 'signing_process_state.dart';

class SigningProcessCubit extends Cubit<SigningProcessState> {
  List<XFile> files = [];
  Uint8List? pdfThumbnail;

  SigningProcessCubit() : super(const SigningProcessInitialState());

  Future<void> selectFile() async {
    final XFile? file = await openFile();
    if (file != null) {
      files.add(file);
      emit(const OnAddAnotherDocumentState());
    }
  }

  Future<void> getPdfFirstPageImage() async {
    try {
      emit(const PdfLoadingState());
      // Load the PDF file from assets
      ByteData pdfData = await rootBundle.load('assets/flow.pdf');
      Uint8List pdfBytes = pdfData.buffer.asUint8List();

      // Save the PDF temporarily to the file system
      final tempDir = await getTemporaryDirectory();
      final tempPdfPath = '${tempDir.path}/temp_pdf.pdf';
      final pdfFile = File(tempPdfPath);
      await pdfFile.writeAsBytes(pdfBytes);

      // Open the PDF document
      final pdfDocument = await PdfDocument.openFile(tempPdfPath);

      // Get the first page
      final page = await pdfDocument.getPage(1);

      // Render the first page as an image
      final pdfPageImage = await page.render(
        width: page.width,
        height: page.height,
      );

      pdfThumbnail = pdfPageImage?.bytes;
      emit(const PdfLoadedState());
    } catch (e) {
      emit(const PdfErrorState());
      print('Error loading PDF: $e');
    }
  }
}
