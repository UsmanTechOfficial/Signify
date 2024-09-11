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

class PdfToThumbnail {
  static Future<Uint8List?> generate({required XFile pdf}) async {
    try {
      final Uint8List pdfBytes = await pdf.readAsBytes();

      final pdfDocument = await PdfDocument.openData(pdfBytes);

      if (pdfDocument.pagesCount > 0) {
        final page = await pdfDocument.getPage(1);

        final pdfPageImage = await page.render(
          width: page.width,
          height: page.height,
        );

        await page.close();
        await pdfDocument.close();

        return pdfPageImage?.bytes;
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
