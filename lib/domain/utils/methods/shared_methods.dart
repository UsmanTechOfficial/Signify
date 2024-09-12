part of '../utils.dart';

class FilePicker {
  static Future<List<XFile>> pick() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'PDFs',
      extensions: ['pdf'],
    );

    final List<XFile> selectedFiles = await openFiles(
      acceptedTypeGroups: [typeGroup],
    );

    return selectedFiles;
  }
}

class PdfSinglePage {
  static Future<PdfPageImage?> get(XFile pdf, {int pageNumber = 1}) async {
    try {
      final Uint8List pdfBytes = await pdf.readAsBytes();

      final pdfDocument = await PdfDocument.openData(pdfBytes);

      if (pdfDocument.pagesCount > 0) {
        final page = await pdfDocument.getPage(pageNumber);

        final pdfPageImage = await page.render(
          width: page.width,
          height: page.height,
        );

        await page.close();
        await pdfDocument.close();

        return pdfPageImage;
      } else {
        throw Exception("PDF has no pages.");
      }
    } catch (e) {
      rethrow;
    }
  }
}

class FileToModel {
  static Future<PickedFileModel> convert(XFile file) async {
    return PickedFileModel(
      name: file.name,
      date: await file.lastModified(),
      bytes: await file.readAsBytes(),
      xFile: file,
    );
  }
}
