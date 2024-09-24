import 'dart:typed_data';

import 'package:dyno_sign/domain/consts/consts.dart';
import 'package:dyno_sign/domain/utils/utils.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class DocumentPreviewWidget extends StatefulWidget {
  final bool previewOnly;
  final XFile pdfFile;
  final Function(PreviewCheck check) result;

  const DocumentPreviewWidget({
    super.key,
    required this.pdfFile,
    required this.result,
    required this.previewOnly,
  });

  @override
  State<DocumentPreviewWidget> createState() => _DocumentPreviewWidgetState();
}

class _DocumentPreviewWidgetState extends State<DocumentPreviewWidget> {
  Uint8List? pdfPageImage;

  @override
  void initState() {
    generatePdfThumbnail();
    super.initState();
  }

  Future<void> generatePdfThumbnail() async {
    try {
      final firstPage = await PdfSinglePage.get(widget.pdfFile);
      if (firstPage != null) {
        setState(() {
          pdfPageImage = firstPage.bytes;
        });
      }
    } catch (e) {
      ///
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
        child:
            pdfPageImage != null ? Image.memory(pdfPageImage!) : const CircularProgressIndicator(),
      ),
    );
  }
}

enum PreviewCheck { keep, discard }
