// DocumentUser Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DocumentUserModel extends Equatable {
  final String email;
  final String firstName;
  final int signingOrder;
  final String status;

  const DocumentUserModel({
    required this.email,
    required this.firstName,
    required this.signingOrder,
    required this.status,
  });

  @override
  List<Object?> get props => [email, firstName, signingOrder, status];

  DocumentUserModel copyWith({
    String? email,
    String? firstName,
    int? signingOrder,
    String? status,
  }) {
    return DocumentUserModel(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      signingOrder: signingOrder ?? this.signingOrder,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'signingOrder': signingOrder,
      'status': status,
    };
  }

  factory DocumentUserModel.empty() {
    return DocumentUserModel(email: '', firstName: '', signingOrder: 1, status: '');
  }

  factory DocumentUserModel.fromMap(Map<String, dynamic> map) {
    return DocumentUserModel(
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      signingOrder: map['signingOrder'] ?? 0,
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentUserModel.fromJson(String source) =>
      DocumentUserModel.fromMap(json.decode(source));
}
