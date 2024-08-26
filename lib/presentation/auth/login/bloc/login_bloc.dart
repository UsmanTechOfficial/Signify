import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  LoginBloc() : super(const LoginState()) {
    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isShowPassword: !state.isShowPassword));
    });

    on<LoginSubmitted>((event, emit) async {
      if (formKey.currentState?.validate() ?? false) {
        emit(state.copyWith(status: LoginStatus.success));
      }
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    return super.close();
  }
}
