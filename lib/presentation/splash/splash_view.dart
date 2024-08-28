import 'package:flutter/material.dart';

import '../../assets_gen/assets.gen.dart';
import '../../domain/consts/font_size.dart';
import '../../domain/custom_widgets/text/custom_text.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<OnboardingBloc>();
    // final height = appHeight(context);
    // final width = appWidth(context);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              "DynoSign",
              fontSize: AppFontSize.displayLargeFont,
              fontWeight: FontWeight.bold,
              space: 2,
            ),
            Assets.icons.pencilIcon.svg(),
          ],
        ),
        const Spacer(),
        const CircularProgressIndicator(),
        const Spacer(),
      ],
    ));
  }
}
