import 'package:dyno_sign/assets_gen/assets.gen.dart';
import 'package:dyno_sign/domain/consts/extention_methods.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/navigation.dart';
import 'package:dyno_sign/infrastructure/navigation/app_routes/routes.dart';
import 'package:dyno_sign/infrastructure/theme/theme_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/consts/global_var.dart';
import '../../../domain/consts/validation.dart';
import '../../widgets/buttons/custom_elevated_button.dart';
import '../../widgets/buttons/custom_elevated_text_button.dart';
import '../../widgets/form_field/custom_formfield.dart';
import '../../widgets/text/custom_text.dart';
import 'bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = appColorScheme(context);
    // final height = appHeight(context);
    // final width = appWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Signin"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            Go.toNamed(Routes.DASHBOARD);
          }
        },
        builder: (context, state) {
          return Form(
            key: context.read<LoginBloc>().formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * .1),
                  const CustomText(
                    "Enter Email",
                    fontSize: AppFontSize.titleXSmallFont,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextFormField(
                    controller: context.read<LoginBloc>().emailController,
                    hint: "Enter Email address",
                    keyboardType: TextInputType.emailAddress,
                    borderColor: color.outlineVariant,
                    borderRadius: AppStyle.buttonBorderRadius,
                    focusNode: context.read<LoginBloc>().emailFocus,
                    onFieldSubmitted: (value) => FocusScope.of(context)
                        .requestFocus(context.read<LoginBloc>().passwordFocus),
                    validator: (p0) => Validation.emailValidation(
                        context.read<LoginBloc>().emailController),
                  ),
                  const SizedBox(height: 20),
                  const CustomText(
                    "Enter Password",
                    fontSize: AppFontSize.titleXSmallFont,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextFormField(
                    hint: 'enter password',
                    controller: context.read<LoginBloc>().passwordController,
                    obscureText: !state.isShowPassword,
                    borderColor: color.outlineVariant,
                    borderRadius: AppStyle.buttonBorderRadius,
                    focusNode: context.read<LoginBloc>().passwordFocus,
                    validator: (p0) => Validation.psdValidation(
                        context.read<LoginBloc>().passwordController),
                    suffix: IconButton(
                        icon: Icon(
                          color: color.outlineVariant,
                          state.isShowPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          context
                              .read<LoginBloc>()
                              .add(TogglePasswordVisibility());
                        }),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Go.toNamed(Routes.FORGET_PASSWORD),
                      child: CustomText(
                        "Forgot password?",
                        color: color.onSurface,
                      ),
                    ),
                  ),
                  CustomElevatedTextButton(
                    width: double.maxFinite,
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    },
                    text: "Signin",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      TextButton(
                        onPressed: () => Go.toNamed(Routes.SIGNUP),
                        child: const Text("Signup"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Center(child: Text("or")),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    width: double.maxFinite,
                    borderColor: color.outlineVariant,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.googleIcon.svg(),
                        10.width(),
                        const CustomText("Continue with google"),
                      ],
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
