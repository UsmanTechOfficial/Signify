import 'dart:io';
import 'dart:typed_data';

import 'package:dyno_sign/domain/consts/consts.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';

import '../widgets/widgets.dart';

class DocumentPreviewView extends StatefulWidget {
  final XFile pdfFile;

  final Function(PreviewCheck check) result;

  const DocumentPreviewView({
    super.key,
    required this.pdfFile,
    required this.result,
  });

  @override
  State<DocumentPreviewView> createState() => _DocumentPreviewViewState();
}

class _DocumentPreviewViewState extends State<DocumentPreviewView> {
  PdfPageImage? pdfPageImage;

  @override
  void initState() {
    generatePdfThumbnail();
    super.initState();
  }

  Future<void> generatePdfThumbnail() async {
    try {
      final Uint8List pdfBytes = await widget.pdfFile.readAsBytes();
      final tempDir = await getTemporaryDirectory();
      final tempPdfPath = '${tempDir.path}/temp_pdf.pdf';
      final pdfFile = File(tempPdfPath);
      await pdfFile.writeAsBytes(pdfBytes);

      final pdfDocument = await PdfDocument.openFile(tempPdfPath);
      final page = await pdfDocument.getPage(1);

      pdfPageImage = await page.render(
        width: page.width,
        height: page.height,
      );
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: CustomIconButton(
          clickEffect: false,
          onPressed: () {
            Go.back();
            widget.result(PreviewCheck.discard);
          },
          icon: const Icon(
            Icons.close,
            size: 25,
          ),
        ),
        title: const CustomText(
          'Sale Invoice',
          fontSize: AppFontSize.titleMediumFont,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            child: CustomElevatedIconButton(
              width: 44,
              height: 44,
              elevation: 0,
              icon: Icons.check,
              iconColor: color.onSurface,
              borderRadius: AppStyle.buttonBorderRadius,
              iconSize: 20,
              fillColor: color.outlineVariant.withOpacity(0.5),
              onPressed: () {
                Go.back();
                widget.result(PreviewCheck.keep);
              },
            ),
          )
        ],
      ),
      body: Center(
        child: pdfPageImage != null
            ? Image.memory(pdfPageImage!.bytes)
            : const CircularProgressIndicator(),
      ),
    );
  }
}

enum PreviewCheck { keep, discard }
