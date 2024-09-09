import 'dart:io';

import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/presentation/widgets/buttons/custom_outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

class DocumentPreviewView extends StatefulWidget {
  const DocumentPreviewView({super.key});

  @override
  State<DocumentPreviewView> createState() => _DocumentPreviewViewState();
}

class _DocumentPreviewViewState extends State<DocumentPreviewView> {
  Uint8List? pdfThumbnail;

  @override
  void initState() {
    getPdfFirstPageImage();
    super.initState();
  }

  Future<void> getPdfFirstPageImage() async {
    try {
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

      setState(() {
        pdfThumbnail = pdfPageImage?.bytes;
      });
    } catch (e) {
      print('Error loading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final color = appColorScheme(context);
    // final height = appHeight(context);
    // final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('DocumentPreview'),
        actions: [
          CustomOutlinedTextButton(
            text: 'Next',
            onPressed: () {
              Go.toNamed(Routes.SELECTED_DOCUMENT);
            },
          )
        ],
      ),
      body: Center(
        child: pdfThumbnail != null
            ? Image.memory(pdfThumbnail!) // Display the rendered image
            : const CircularProgressIndicator(), // Show a loading spinner while the image is loading
      ),
    );
  }
}
