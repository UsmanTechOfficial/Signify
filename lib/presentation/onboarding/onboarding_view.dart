import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../assets_gen/assets.gen.dart';
import '../../domain/consts/global_var.dart';

import '../widgets/buttons/custom_outlined_text_button.dart';
import '../widgets/buttons/custom_rouded_button.dart';
import 'bloc/onboarding_bloc.dart';
import 'bloc/onboarding_event.dart';
import 'bloc/onboarding_state.dart';
import 'widgets/onboarding_page_indicator.dart';
import 'widgets/onboarding_tabs.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final bloc = context.read<OnboardingBloc>();
    final height = appHeight(context);
    // final width = appWidth(context);
    return Scaffold(
        appBar: AppBar(
          leading: Transform.scale(
            scale: 0.7,
            child: Center(
              child: Assets.icons.pencilIcon.svg(
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          actions: [
            CustomOutlinedTextButton(
              height: 35,
              text: "Skip",
              borderColor: color.outline.withOpacity(0.5),
              onPressed: () {
                bloc.add(SkipEvent());
              },
            ),
          ],
        ),
        body: BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            if (state is OnPageChanged) {
              context.read<OnboardingBloc>().pageController.animateToPage(
                    state.page,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
            }
          },
          builder: (context, state) {
            final bloc = context.read<OnboardingBloc>();
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.7,
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: bloc.pageController,
                      onPageChanged: (index) {
                        bloc.add(PageChangedEvent(index));
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return OnboardingTab(
                          image: bloc.tabImages[index],
                          label: bloc.tabLabels[index],
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          3,
                          (index) {
                            return OnboardingPageIndicator(
                              isActive: index == state.page,
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      CustomRoundedIconButton(
                        iconRotationAngle: 1,
                        icon: Icons.play_arrow_rounded,
                        borderColor:
                            Theme.of(context).colorScheme.outlineVariant,
                        iconColor: Theme.of(context).colorScheme.onSurface,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        onPressed: () {
                          bloc.add(PreviousPageEvent());
                        },
                      ),
                      const SizedBox(width: 10),
                      CustomRoundedIconButton(
                        icon: Icons.play_arrow_rounded,
                        iconColor: Theme.of(context).colorScheme.surface,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        onPressed: () {
                          bloc.add(NextPageEvent());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
