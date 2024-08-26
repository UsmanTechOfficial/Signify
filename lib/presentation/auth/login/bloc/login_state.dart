part of 'login_bloc.dart';

enum LoginStatus { initial, success, failure }

class LoginState extends Equatable {
  final bool isShowPassword;
  final LoginStatus status;

  const LoginState({
    this.isShowPassword = false,
    this.status = LoginStatus.initial,
  });

  LoginState copyWith({
    bool? isShowPassword,
    LoginStatus? status,
  }) {
    return LoginState(
      isShowPassword: isShowPassword ?? this.isShowPassword,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [isShowPassword, status];
}
