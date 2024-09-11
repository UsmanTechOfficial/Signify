import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';
import '../../signing_process/document_preview_view.01.dart';

class PdfPreviewDialog {
  static show(XFile pdfFile, {required Function(PreviewCheck) check, BuildContext? context}) {
    showGeneralDialog(
      context: context ?? navigatorKey.currentContext!,
      barrierDismissible: false,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return DocumentPreviewView(pdfFile: pdfFile, result: check);
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
