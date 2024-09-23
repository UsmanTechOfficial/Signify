import 'package:dyno_sign/presentation/widgets/bottom_sheets/bottom_sheets.dart';
import 'package:flutter/material.dart';

class SignSelectedSheet extends StatelessWidget {
  final VoidCallback onForMe;
  final VoidCallback onByOthers;

  const SignSelectedSheet(
      {super.key, required this.onForMe, required this.onByOthers});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomBottomSheetTile(
        title: "Only for me",
        subtitle: "Sign documents only for yourself",
        onTap: onForMe,
      ),
      CustomBottomSheetTile(
        title: "Send By Others",
        subtitle: "Make templates and use them again and again. ",
        onTap: onByOthers,
      )
    ]);
  }
}
