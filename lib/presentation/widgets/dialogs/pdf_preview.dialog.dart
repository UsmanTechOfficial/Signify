import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';
import '../../signing_process/request_signature/document_preview_view.01.dart';

class PdfPreviewDialog {
  static show(XFile file,
      {required Function(PreviewCheck) check, BuildContext? context, bool previewOnly = false}) {
    showGeneralDialog(
      context: context ?? navigatorKey.currentContext!,
      barrierDismissible: false,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DocumentPreviewWidget(pdfFile: file, result: check, previewOnly: previewOnly);
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
