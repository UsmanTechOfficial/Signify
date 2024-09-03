import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:flutter/material.dart';

import '../../widgets/text/custom_text.dart';

class OnboardingTab extends StatelessWidget {
  final Widget image;
  final String label;

  const OnboardingTab({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: double.maxFinite,
            height: appHeight(context) * 0.4,
            child: image),
        CustomText(label),
      ],
    );
  }
}
