import 'dart:convert';

import 'package:equatable/equatable.dart';

class ForgotPasswordModel extends Equatable {
  final String email;

  const ForgotPasswordModel({
    required this.email,
  });

  @override
  List<Object?> get props => [email];

  ForgotPasswordModel copyWith({
    String? email,
  }) {
    return ForgotPasswordModel(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory ForgotPasswordModel.fromMap(Map<String, dynamic> map) {
    return ForgotPasswordModel(
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgotPasswordModel.fromJson(String source) =>
      ForgotPasswordModel.fromMap(json.decode(source));
}
