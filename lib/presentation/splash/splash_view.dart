import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import '../../domain/consts/font_size.dart';
import '../widgets/text/custom_text.dart';
import 'bloc/splash_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashBloc>().add(CheckUserStatus());

    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        // Navigate based on the SplashState
        if (state == SplashState.newUser) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Go.toNamed(Routes.ONBOARDING);
          });
        } else if (state == SplashState.returningUser) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Go.toNamed(Routes.ONBOARDING);
          });
        }

        // Build the SplashView
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
            ],
          ),
        );
      },
    );
  }
}
