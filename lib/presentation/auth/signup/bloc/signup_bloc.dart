import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfPsdController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final cnfPsdFocus = FocusNode();

  SignupBloc() : super(const SignupState()) {
    on<TogglePasswordVisibility>((TogglePasswordVisibility event, Emitter<SignupState> emit) {
      emit(state.copyWith(isShowPassword: !state.isShowPassword));
    });

    on<ToggleConfirmPasswordVisibility>(
        (ToggleConfirmPasswordVisibility event, Emitter<SignupState> emit) {
      emit(state.copyWith(isShowConfirmPassword: !state.isShowConfirmPassword));
    });

    on<SignupSubmitted>((SignupSubmitted event, Emitter<SignupState> emit) async {
      if (formKey.currentState?.validate() ?? false) {
        emit(state.copyWith(status: SignupStatus.success));
        // Handle signup logic here
      }
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    cnfPsdController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    cnfPsdFocus.dispose();
    return super.close();
  }
}
