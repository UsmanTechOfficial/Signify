import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocus = FocusNode();

  ForgetPasswordBloc() : super(const ForgetPasswordState()) {
    on<EmailChanged>((event, emit) {
      final isValid = _validateEmail(event.email);
      emit(state.copyWith(email: event.email, isValid: isValid));
    });

    on<ForgetPasswordSubmitted>((event, emit) async {
      if (formKey.currentState?.validate() ?? false) {
        emit(state.copyWith(status: ForgetPasswordStatus.loading));
        await Future.delayed(const Duration(seconds: 2)); // Simulate API call
        emit(state.copyWith(status: ForgetPasswordStatus.success));
        // Navigate to dashboard
        Navigator.of(formKey.currentContext!)
            .pushReplacementNamed('/dashboard');
      }
    });
  }

  bool _validateEmail(String email) {
    return email.isNotEmpty && email.contains('@'); // Basic validation
  }

  @override
  Future<void> close() {
    emailController.dispose();
    emailFocus.dispose();
    return super.close();
  }
}
