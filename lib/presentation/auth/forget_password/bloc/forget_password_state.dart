part of 'forget_password_bloc.dart';

enum ForgetPasswordStatus { initial, success, failure, loading }

class ForgetPasswordState extends Equatable {
  final String email;
  final ForgetPasswordStatus status;
  final bool isValid;

  const ForgetPasswordState({
    this.email = '',
    this.status = ForgetPasswordStatus.initial,
    this.isValid = false,
  });

  ForgetPasswordState copyWith({
    String? email,
    ForgetPasswordStatus? status,
    bool? isValid,
  }) {
    return ForgetPasswordState(
      email: email ?? this.email,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [email, status, isValid];
}
