import 'package:dyno_sign/domain/consts/extention_methods.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../assets_gen/assets.gen.dart';
import '../../../domain/consts/font_size.dart';
import '../../../domain/consts/global_var.dart';
import '../../../domain/consts/styles.dart';
import '../../../domain/consts/validation.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_elevated_text_button.dart';
import '../../widgets/form_field/custom_formfield.dart';
import '../../widgets/text/custom_text.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_event.dart';
import 'bloc/signup_state.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final bloc = context.read<SignupBloc>();
    // final height = appHeight(context);
    final width = appWidth(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Signup"),
        ),
        body: Form(
          key: bloc.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: width * .1),
                const CustomText(
                  "Enter Email",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
                CustomTextFormField(
                  controller: context.read<SignupBloc>().emailController,
                  hint: "Enter Email address",
                  keyboardType: TextInputType.emailAddress,
                  borderColor: color.outlineVariant,
                  borderRadius: AppStyle.buttonBorderRadius,
                  focusNode: context.read<SignupBloc>().emailFocus,
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(context.read<SignupBloc>().passwordFocus),
                  validator: (p0) =>
                      Validation.psdValidation(context.read<SignupBloc>().emailController),
                ),
                20.height(),
                const CustomText(
                  "Enter Password",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (_, state) {
                    return CustomTextFormField(
                      hint: 'enter password',
                      controller: context.read<SignupBloc>().passwordController,
                      obscureText: bloc.state.isShowPassword,
                      borderColor: color.outlineVariant,
                      borderRadius: AppStyle.buttonBorderRadius,
                      focusNode: context.read<SignupBloc>().passwordFocus,
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
                        context.read<SignupBloc>().cnfPsdFocus,
                      ),
                      validator: (p0) => Validation.psdValidation(
                        context.read<SignupBloc>().passwordController,
                      ),
                      suffix: IconButton(
                          icon: Icon(
                            color: color.outlineVariant,
                            bloc.state.isShowPassword ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            context.read<SignupBloc>().add(TogglePasswordVisibility());
                          }),
                    );
                  },
                ),
                20.height(),
                const CustomText(
                  "Confirm Password",
                  fontSize: AppFontSize.titleXSmallFont,
                  fontWeight: FontWeight.w500,
                ),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (_, state) {
                    return CustomTextFormField(
                      hint: 'enter confirm password',
                      controller: context.read<SignupBloc>().cnfPsdController,
                      obscureText: bloc.state.isShowConfirmPassword,
                      borderColor: color.outlineVariant,
                      borderRadius: AppStyle.buttonBorderRadius,
                      focusNode: context.read<SignupBloc>().cnfPsdFocus,
                      validator: (p0) => Validation.psdValidation(
                        context.read<SignupBloc>().cnfPsdController,
                      ),
                      suffix: IconButton(
                          icon: Icon(
                            color: color.outlineVariant,
                            bloc.state.isShowConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            context.read<SignupBloc>().add(ToggleConfirmPasswordVisibility());
                          }),
                    );
                  },
                ),
                50.height(),
                CustomElevatedTextButton(
                  width: double.maxFinite,
                  text: "Signup",
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      "Already have an account?",
                      fontSize: AppFontSize.titleXSmallFont,
                    ),
                    TextButton(
                      onPressed: () => Go.back(),
                      child: const Text("Signin"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomText(
                    "or",
                    color: color.outline,
                    fontSize: AppFontSize.titleXSmallFont,
                  ),
                ),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  onPressed: () {},
                  fillColor: color.surface,
                  borderColor: color.outlineVariant,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.icons.googleIcon.svg(),
                      const SizedBox(width: 8),
                      CustomText(
                        "Continue With Google",
                        fontSize: AppFontSize.titleXSmallFont,
                        color: color.outline,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
