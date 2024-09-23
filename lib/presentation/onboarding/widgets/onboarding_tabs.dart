import 'package:dyno_sign/domain/consts/font_size.dart';
import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:flutter/material.dart';

import '../../widgets/text/custom_text.dart';

class OnboardingTab extends StatelessWidget {
  final Widget image;
  final String label;
  final String subTitle;

  const OnboardingTab(
      {super.key,
      required this.image,
      required this.label,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: double.maxFinite,
            height: appHeight(context) * 0.4,
            child: image),
        CustomText(
          label,
          fontSize: AppFontSize.titleSmallFont,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 5),
        CustomText(
          subTitle,
          fontSize: AppFontSize.labelMediumFont,
          color: color.outline,
        )
      ],
    );
  }
}
