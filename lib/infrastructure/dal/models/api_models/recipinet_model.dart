// Recipient Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RecipientModel extends Equatable {
  final String email;

  const RecipientModel({
    required this.email,
  });

  @override
  List<Object?> get props => [email];

  RecipientModel copyWith({
    String? email,
  }) {
    return RecipientModel(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory RecipientModel.fromMap(Map<String, dynamic> map) {
    return RecipientModel(
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipientModel.fromJson(String source) => RecipientModel.fromMap(json.decode(source));
}
