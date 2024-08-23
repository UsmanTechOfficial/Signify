import 'package:flutter/material.dart';

import '../../../domain/consts/global_var.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final bool isActive;

  const OnboardingPageIndicator({
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8,
      width: isActive ? 25 : 8,
      decoration: BoxDecoration(
        color: isActive ? appColorScheme(context).primary : Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
