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
  static Future<XFile?> convert() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      return null;
    }

    final imageFile = File(pickedFile.path);

    final pdf = pw.Document();

    final image = pw.MemoryImage(imageFile.readAsBytesSync());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(image),
          );
        },
      ),
    );

    final outputDir = await getTemporaryDirectory();
    final pdfFilePath = path.join(outputDir.path, 'converted_image.pdf');
    final pdfFile = File(pdfFilePath);

    await pdfFile.writeAsBytes(await pdf.save());

    return XFile(pdfFilePath);
  }
}

class CameraImageToPdf {
  static Future<XFile?> convert() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) {
      return null;
    }

    final imageFile = File(pickedFile.path);

    final pdf = pw.Document();

    final image = pw.MemoryImage(imageFile.readAsBytesSync());

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(image),
          );
        },
      ),
    );

    final outputDir = await getTemporaryDirectory();
    final pdfFilePath = path.join(outputDir.path, 'converted_image.pdf');
    final pdfFile = File(pdfFilePath);

    await pdfFile.writeAsBytes(await pdf.save());

    return XFile(pdfFilePath);
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
    final firstPage = await PdfSinglePage.get(file);
    return PickedFileModel(
      name: file.name,
      date: await file.lastModified(),
      bytes: firstPage!.bytes,
      xFile: file,
    );
  }
}
