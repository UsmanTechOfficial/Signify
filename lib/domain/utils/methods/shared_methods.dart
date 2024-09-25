part of '../utils.dart';

class FilePicker {
  static Future<List<XFile>> pick() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'PDFs',
      extensions: ['pdf'],
      uniformTypeIdentifiers: ['public.pdf'],
    );

    final List<XFile> selectedFiles = await openFiles(
      acceptedTypeGroups: [typeGroup],
    );

    return selectedFiles;
  }
}

class GalleryImageToPdf {
  static Future<dynamic?> convert() async {
    // final picker = ImagePicker();
    // final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    //
    // if (pickedFile == null) {
    //   return null;
    // }
    //
    // final imageFile = File(pickedFile.path);
    //
    // final pdf = pw.Document();
    //
    // final image = pw.MemoryImage(imageFile.readAsBytesSync());
    //
    // pdf.addPage(
    //   pw.Page(
    //     build: (pw.Context context) {
    //       return pw.Center(
    //         child: pw.Image(image),
    //       );
    //     },
    //   ),
    // );
    //
    // final outputDir = await getTemporaryDirectory();
    // final pdfFilePath = path.join(outputDir.path, 'converted_image.pdf');
    // final pdfFile = File(pdfFilePath);
    //
    // await pdfFile.writeAsBytes(await pdf.save());
    //
    // return XFile(pdfFilePath);
  }
}

class CameraImageToPdf {
  static Future<dynamic?> convert() async {
    // final picker = ImagePicker();
    // final pickedFile = await picker.pickImage(source: ImageSource.camera);
    //
    // if (pickedFile == null) {
    //   return null;
    // }
    //
    // final imageFile = File(pickedFile.path);
    //
    // final pdf = pw.Document();
    //
    // final image = pw.MemoryImage(imageFile.readAsBytesSync());
    //
    // pdf.addPage(
    //   pw.Page(
    //     build: (pw.Context context) {
    //       return pw.Center(
    //         child: pw.Image(image),
    //       );
    //     },
    //   ),
    // );
    //
    // final outputDir = await getTemporaryDirectory();
    // final pdfFilePath = path.join(outputDir.path, 'converted_image.pdf');
    // final pdfFile = File(pdfFilePath);
    //
    // await pdfFile.writeAsBytes(await pdf.save());
    //
    // return XFile(pdfFilePath);
  }
}

// class CameraImageToPdf {
//   static Future<XFile?> convert() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//
//     if (pickedFile == null) {
//       return null;
//     }
//
//     final imageFile = File(pickedFile.path);
//
//     final pdf = pw.Document();
//
//     final image = pw.MemoryImage(imageFile.readAsBytesSync());
//
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Image(image),
//           );
//         },
//       ),
//     );
//
//     final outputDir = await getTemporaryDirectory();
//     final pdfFilePath = path.join(outputDir.path, 'converted_image.pdf');
//     final pdfFile = File(pdfFilePath);
//
//     await pdfFile.writeAsBytes(await pdf.save());
//
//     return XFile(pdfFilePath);
//   }
// }

// class PdfSinglePage {
//   static Future<PdfPageImage?> get(XFile pdf, {int pageNumber = 1}) async {
//     try {
//       final Uint8List pdfBytes = await pdf.readAsBytes();
//
//       final pdfDocument = await PdfDocument.openData(pdfBytes);
//
//       if (pdfDocument.pagesCount > 0) {
//         final page = await pdfDocument.getPage(pageNumber);
//
//         final pdfPageImage = await page.render(
//           width: page.width,
//           height: page.height,
//         );
//
//         await page.close();
//         await pdfDocument.close();
//
//         return pdfPageImage;
//       } else {
//         throw Exception("PDF has no pages.");
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

class PdfFirstPage {
  /// Extracts the first page from a given PDF file and returns it as a new `SelectedFileModel`.
  static Future<SelectedFileModel?> get(XFile pdfFile) async {
    try {
      // Read the PDF file as bytes.
      Uint8List pdfBytes = await pdfFile.readAsBytes();

      // Load the PDF document.
      final PdfDocument document = PdfDocument(inputBytes: pdfBytes);

      // Access the first page of the original document.
      final PdfPage firstPage = document.pages[0];

      // Create a template from the first page.
      PdfTemplate template = firstPage.createTemplate();

      // Create a new PDF document to store the first page.
      PdfDocument newDocument = PdfDocument();

      // Add a new page to the new document and draw the template.
      newDocument.pages.add().graphics.drawPdfTemplate(
            template,
            const Offset(0, 0),
            template.size,
          );

      // Save the new PDF with just the first page and get the bytes.
      List<int> bytes = await newDocument.save();

      // Dispose of the documents to free up memory.
      document.dispose();
      newDocument.dispose();

      // Convert the bytes to a new XFile for the first page.
      XFile firstPageXFile = XFile.fromData(
        Uint8List.fromList(bytes),
        name: '${pdfFile.name}_first_page.pdf',
        mimeType: 'application/pdf',
      );

      // Get the original document's name and the current date.
      String originalName = pdfFile.name;
      DateTime creationDate = await pdfFile.lastModified();

      // Return the SelectedFileModel with the original name, date, first page bytes, and XFile.
      return SelectedFileModel(
        name: originalName,
        date: creationDate,
        bytes: Uint8List.fromList(bytes),
        xFile: firstPageXFile,
      );
    } catch (e) {
      return null;
    }
  }
}

class PdfSinglePage {
  static Future<dynamic> get(XFile pdf, {int pageNumber = 1}) async {
    try {
      // final Uint8List pdfBytes = await pdf.readAsBytes();
      //
      // final pdfDocument = await PdfDocument.openData(pdfBytes);
      //
      // if (pdfDocument.pagesCount > 0) {
      //   final page = await pdfDocument.getPage(pageNumber);
      //
      //   final pdfPageImage = await page.render(
      //     width: page.width,
      //     height: page.height,
      //   );
      //
      //   await page.close();
      //   await pdfDocument.close();
      //
      //   return pdfPageImage;
      // } else {
      //   throw Exception("PDF has no pages.");
      // }
    } catch (e) {
      rethrow;
    }
  }
}

class FileToModel {
  static Future<SelectedFileModel> convert(XFile file) async {
    final firstPage = await PdfSinglePage.get(file);
    return SelectedFileModel(
      name: file.name,
      date: await file.lastModified(),
      bytes: firstPage!.bytes,
      xFile: file,
    );
  }
}
