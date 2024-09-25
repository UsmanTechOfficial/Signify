import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../domain/consts/consts.dart';
import '../widgets.dart';

class PdfPreviewDialog {
  static show(Uint8List page,
      {required Function(PreviewCheck) check, BuildContext? context, bool previewOnly = false}) {
    showGeneralDialog(
      context: context ?? navigatorKey.currentContext!,
      barrierDismissible: false,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DocumentPreviewWidget(pdfPage: page, result: check, previewOnly: previewOnly);
      },
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
    );
  }
}

class DocumentPreviewWidget extends StatefulWidget {
  final bool previewOnly;
  final Uint8List pdfPage;
  final Function(PreviewCheck check) result;

  const DocumentPreviewWidget({
    super.key,
    required this.pdfPage,
    required this.result,
    required this.previewOnly,
  });

  @override
  State<DocumentPreviewWidget> createState() => _DocumentPreviewWidgetState();
}

class _DocumentPreviewWidgetState extends State<DocumentPreviewWidget> {
  Uint8List? pdfPageData;

  @override
  void initState() {
    super.initState();
    loadPdfData();
  }

  Future<void> loadPdfData() async {
    try {
      // Load the PDF bytes from the assets folder
      ByteData pdfByteData = await rootBundle.load('assets/flow.pdf');

      // Convert the ByteData to Uint8List
      Uint8List examplePdfBytes = pdfByteData.buffer.asUint8List();

      // Set the loaded PDF bytes to the state
      setState(() {
        pdfPageData = examplePdfBytes;
      });

      // Debugging output to verify the loaded bytes
      print('PDF bytes loaded: ${examplePdfBytes.length}');
    } catch (e) {
      // Handle any errors during loading
      print("Error loading PDF data: $e");
    }
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
                      widget.result(PreviewCheck.keep);
                    },
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: Center(
        child: pdfPageData != null
            ? SfPdfViewer.memory(pdfPageData!) // Display PDF directly from memory
            : const CircularProgressIndicator(),
      ),
    );
  }
}

enum PreviewCheck { keep, discard }
