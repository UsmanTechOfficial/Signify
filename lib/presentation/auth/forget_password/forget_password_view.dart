import 'package:dyno_sign/domain/consts/validation.dart';
import 'package:dyno_sign/domain/custom_widgets/text/custom_text.dart';
import 'package:dyno_sign/infrastructure/theme/theme_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/consts/global_var.dart';
import '../../../domain/custom_widgets/buttons/custom_elevated_text_button.dart';
import '../../../domain/custom_widgets/form_field/custom_formfield.dart';
import 'bloc/forget_password_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  static const routeName = "/forgotPasswordView";

  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    final height = appHeight(context);
    final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Forgot password"),
      ),
      body: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
        builder: (context, state) {
          final bloc = context.read<ForgetPasswordBloc>();
          return Form(
            key: bloc.formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * .05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * .8,
                    child: CustomText(
                      fontSize: AppFontSize.titleXSmallFont,
                      color: color.outline,
                      textAlign: TextAlign.center,
                      "Enter your email so we will send you the verification code to your provided email.",
                    ),
                  ),
                  SizedBox(height: height * .1),
                  const CustomText(
                    "Enter Email",
                    fontSize: AppFontSize.titleXSmallFont,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    controller: bloc.emailController,
                    hint: "Enter Email address",
                    keyboardType: TextInputType.emailAddress,
                    borderColor: color.outlineVariant,
                    borderRadius: AppStyle.buttonBorderRadius,
                    focusNode: bloc.emailFocus,
                    onChanged: (value) => bloc.add(EmailChanged(value)),
                    validator: (value) => Validation.emailValidation(
                      TextEditingController(text: value),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedTextButton(
                    width: double.maxFinite,
                    borderRadius: AppStyle.buttonBorderRadius,
                    onPressed: () {
                      if (state.isValid) {
                        bloc.add(ForgetPasswordSubmitted());
                      }
                    },
                    text: "Submit",
                  ),
                  if (state.status == ForgetPasswordStatus.loading)
                    const Center(child: CircularProgressIndicator()),
                  if (state.status == ForgetPasswordStatus.success)
                    Center(
                      child: CustomText(
                        "Check your email for verification code!",
                        fontSize: AppFontSize.titleXSmallFont,
                        color: color.primary,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
