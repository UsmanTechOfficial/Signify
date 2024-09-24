part of 'req_sign_doc_model.dart';

class EmailDetailModel extends Equatable {
  final String email;
  final String message;

  const EmailDetailModel({
    required this.email,
    required this.message,
  });

  factory EmailDetailModel.empty() {
    return const EmailDetailModel(
      email: '',
      message: '',
    );
  }

  EmailDetailModel copyWith({
    String? email,
    String? message,
  }) {
    return EmailDetailModel(
      email: email ?? this.email,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, message];

  @override
  bool get stringify => true;
}
