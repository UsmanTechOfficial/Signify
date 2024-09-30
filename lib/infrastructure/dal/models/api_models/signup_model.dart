// SignUp Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const SignUpModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, password];

  SignUpModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return SignUpModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }

  factory SignUpModel.fromMap(Map<String, dynamic> map) {
    return SignUpModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpModel.fromJson(String source) => SignUpModel.fromMap(json.decode(source));
}
