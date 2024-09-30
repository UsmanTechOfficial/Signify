import 'dart:typed_data';

import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../domain/consts/consts.dart';
import '../widgets.dart';

class PdfPreviewDialog {
  static show(
    XFile file, {
    required Function(PreviewCheck) check,
    BuildContext? context,
    bool previewOnly = false,
  }) {
    showGeneralDialog(
      context: context ?? navigatorKey.currentContext!,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DocumentPreviewWidget(
          pdfFile: file,
          onSelect: check,
          previewOnly: previewOnly,
        );
      },
    );
  }
}

class DocumentPreviewWidget extends StatefulWidget {
  final bool previewOnly;
  final XFile pdfFile;
  final Function(PreviewCheck check) onSelect;

  const DocumentPreviewWidget({
    super.key,
    required this.pdfFile,
    required this.onSelect,
    required this.previewOnly,
  });

  @override
  State<DocumentPreviewWidget> createState() => _DocumentPreviewWidgetState();
}

class _DocumentPreviewWidgetState extends State<DocumentPreviewWidget> {
  Uint8List? _newDocumentBytes;
  final String _pdfName = '';

  @override
  void initState() {
    super.initState();
    _previewPage();
    // if (widget.previewOnly) {
    //   _previewPage();
    // } else {
    //   _extractFirstPage();
    // }
  }

  Future<void> _previewPage() async {
    _newDocumentBytes = await widget.pdfFile.readAsBytes();
    setState(() {});
  }

  // Future<void> _extractFirstPage() async {
  //   try {
  //     _pdfName = widget.pdfFile.name;
  //     final pdfBytes = await widget.pdfFile.readAsBytes();
  //
  //     final PdfDocument document = PdfDocument(inputBytes: pdfBytes);
  //
  //     // Extract the first page of the document
  //     final PdfDocument newDocument = PdfDocument();
  //     newDocument.pages.add().graphics.drawPdfTemplate(
  //           document.pages[0].createTemplate(),
  //           const Offset(0, 0),
  //         );
  //
  //     // Save the extracted first page as a new document
  //     final List<int> newDocBytes = newDocument.saveSync();
  //     newDocument.dispose();
  //
  //     // Convert List<int> to Uint8List for preview
  //     final Uint8List newDocUint8List = Uint8List.fromList(newDocBytes);
  //
  //     // Store the new document bytes for preview
  //     setState(() {
  //       _newDocumentBytes = newDocUint8List;
  //     });
  //   } catch (e) {
  //     print('Error extracting first page: $e');
  //   }
  // }

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
            widget.onSelect(PreviewCheck.discard);
          },
          icon: const Icon(
            Icons.close,
            size: 25,
          ),
        ),
        title: CustomText(
          _pdfName,
          fontSize: AppFontSize.titleMediumFont,
        ),
        actions: [
          !widget.previewOnly
              ? Padding(
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
                      widget.onSelect(PreviewCheck.keep);
                    },
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: _newDocumentBytes == null
          ? const Center(child: CircularProgressIndicator())
          : SfPdfViewer.memory(_newDocumentBytes!), // Display the PDF preview
    );
  }
}

enum PreviewCheck { keep, discard }
