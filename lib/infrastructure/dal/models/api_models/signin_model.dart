import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  final String email;
  final String password;

  const SignInModel({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

  SignInModel copyWith({
    String? email,
    String? password,
  }) {
    return SignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInModel.fromJson(String source) => SignInModel.fromMap(json.decode(source));
}
