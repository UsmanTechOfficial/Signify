// Account Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final String webhookUrl;

  const AccountModel({
    required this.webhookUrl,
  });

  @override
  List<Object?> get props => [webhookUrl];

  AccountModel copyWith({
    String? webhookUrl,
  }) {
    return AccountModel(
      webhookUrl: webhookUrl ?? this.webhookUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'webhookUrl': webhookUrl,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      webhookUrl: map['webhookUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) => AccountModel.fromMap(json.decode(source));
}
