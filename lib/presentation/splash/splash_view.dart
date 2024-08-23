import 'package:dyno_sign/domain/consts/global_var.dart';
import 'package:dyno_sign/domain/custom_widgets/buttons/custom_elevated_text_button.dart';
import 'package:dyno_sign/domain/custom_widgets/text/custom_text.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/theme/theme_library.dart';
import 'package:dyno_sign/presentation/splash/bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import '../../infrastructure/navigation/app_routes/routes.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/splash_state.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // final color = appColorScheme(context);
    final bloc = context.read<SplashBloc>();
    final height = appHeight(context);
    final width = appWidth(context);
    bloc.add(CheckUserStatus());
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (_, state) {
          if (state == SplashState.returningUser) {
            Go.offAllToNamed(Routes.LOGIN);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.1),
              child: CustomElevatedTextButton(
                borderRadius: AppStyle.borderRadius,
                width: width * 0.9,
                text: "Get Started",
                onPressed: () => {
                  Go.offAllToNamed(
                    Routes.ONBOARDING,
                  ),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
