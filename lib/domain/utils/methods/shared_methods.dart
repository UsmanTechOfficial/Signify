part of '../utils.dart';

class FilePicker {
  static Future<List<XFile>?> pick() async {
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

class CameraImageToPdfModel {
  /// Method to capture an image from the camera and convert it into a PDF
  static Future<SelectedFileModel?> capture() async {
    try {
      // Pick an image from the camera
      final pickedFile = await getIt<ImagePicker>().pickImage(source: ImageSource.camera);

      // Return null if no image is captured
      if (pickedFile == null) {
        return null;
      }

      final name = pickedFile.name;
      final dateCreated = DateTime.now();

      // Read the image as bytes
      final selectedImageBytes = await File(pickedFile.path).readAsBytes();

      // Load the image into PdfBitmap
      final PdfBitmap image = PdfBitmap(selectedImageBytes);

      // Create a new PDF document
      PdfDocument newDocument = PdfDocument();
      final PdfPage page = newDocument.pages.add();

      // Draw the image on the PDF page
      page.graphics.drawImage(
        image,
        Rect.fromLTWH(0, 0, page.size.width, page.size.height),
      );

      // Save the PDF document as bytes
      List<int> newDocBytes = await newDocument.save();
      newDocument.dispose();

      // Convert List<int> to Uint8List for file preview
      final Uint8List newDocUint8List = Uint8List.fromList(newDocBytes);

      // Return a model containing file details
      return SelectedFileModel(
        name: name,
        date: dateCreated,
        bytes: newDocUint8List,
      );
    } catch (e) {
      print('Error occurred while capturing image and creating PDF: $e');
      return null;
    }
  }
}

class GalleryImageToPdfModel {
  /// Method to capture an image from the camera and convert it into a PDF
  static Future<SelectedFileModel?> pick() async {
    try {
      // Pick an image from the camera
      final pickedFile = await getIt<ImagePicker>().pickImage(source: ImageSource.gallery);

      // Return null if no image is captured
      if (pickedFile == null) {
        return null;
      }

      final name = pickedFile.name;
      final dateCreated = DateTime.now();

      // Read the image as bytes
      final selectedImageBytes = await File(pickedFile.path).readAsBytes();

      // Load the image into PdfBitmap
      final PdfBitmap image = PdfBitmap(selectedImageBytes);

      // Create a new PDF document
      PdfDocument newDocument = PdfDocument();
      final PdfPage page = newDocument.pages.add();

      // Draw the image on the PDF page
      page.graphics.drawImage(
        image,
        Rect.fromLTWH(0, 0, page.size.width, page.size.height),
      );

      // Save the PDF document as bytes
      List<int> newDocBytes = await newDocument.save();
      newDocument.dispose();

      // Convert List<int> to Uint8List for file preview
      final Uint8List newDocUint8List = Uint8List.fromList(newDocBytes);

      // Return a model containing file details
      return SelectedFileModel(
        name: name,
        date: dateCreated,
        bytes: newDocUint8List,
      );
    } catch (e) {
      print('Error occurred while capturing image and creating PDF: $e');
      return null;
    }
  }
}

class PdfFirstPage {
  /// Extracts the first page from a given PDF file and returns it as a new `SelectedFileModel`.
  static Future<SelectedFileModel?> get(XFile pdfFile) async {
    try {
      final pdfName = pdfFile.name;
      final pdfDate = DateTime.now();
      final pdfBytes = await pdfFile.readAsBytes();
      final PdfDocument document = PdfDocument(inputBytes: pdfBytes);

      // Extract the first page of the document
      final PdfDocument newDocument = PdfDocument();
      newDocument.pages.add().graphics.drawPdfTemplate(
            document.pages[0].createTemplate(),
            const Offset(0, 0),
          );

      // Save the extracted first page as a new document
      final List<int> newDocBytes = newDocument.saveSync();
      newDocument.dispose();

      // Convert List<int> to Uint8List for preview
      final Uint8List newDocUint8List = Uint8List.fromList(newDocBytes);

      return SelectedFileModel(
        name: pdfName,
        date: pdfDate,
        bytes: newDocUint8List,
      );
    } catch (e) {
      return null;
    }
  }
}

class FileToModel {
  static Future<SelectedFileModel> convert(XFile file) async {
    final firstPage = await PdfFirstPage.get(file);
    return SelectedFileModel(
      name: file.name,
      date: await file.lastModified(),
      bytes: firstPage!.bytes,
    );
  }
}
