part of 'signup_bloc.dart';

enum SignupStatus { initial, success, failure }

class SignupState extends Equatable {
  final bool isShowPassword;
  final bool isShowConfirmPassword;
  final SignupStatus status;

  const SignupState({
    this.isShowPassword = true,
    this.isShowConfirmPassword = true,
    this.status = SignupStatus.initial,
  });

  SignupState copyWith({
    bool? isShowPassword,
    bool? isShowConfirmPassword,
    SignupStatus? status,
  }) {
    return SignupState(
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowConfirmPassword:
          isShowConfirmPassword ?? this.isShowConfirmPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [isShowPassword, isShowConfirmPassword, status];
}
