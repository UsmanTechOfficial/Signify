import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets_gen/assets.gen.dart';
import '../../../domain/consts/consts.dart';
import '../../widgets/buttons/custom_elevated_text_button.dart';
import '../../widgets/text/custom_text.dart';
import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_state.dart';
import '../onboarding_view.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = appHeight(context);
    final width = appWidth(context);
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Column(
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
                  borderRadius: AppStyle.buttonBorderRadius,
                  width: width * 0.9,
                  text: "Get Started",
                  onPressed: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: OnboardingBloc(),
                            child: const OnboardingView(),
                          ),
                        ))
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
