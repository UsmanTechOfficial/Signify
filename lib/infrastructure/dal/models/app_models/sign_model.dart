// Sign Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignModel extends Equatable {
  final String userId;
  final String file;
  final String signType;
  final bool isDefault;

  const SignModel({
    required this.userId,
    required this.file,
    required this.signType,
    required this.isDefault,
  });

  @override
  List<Object?> get props => [userId, file, signType, isDefault];

  SignModel copyWith({
    String? userId,
    String? file,
    String? signType,
    bool? isDefault,
  }) {
    return SignModel(
      userId: userId ?? this.userId,
      file: file ?? this.file,
      signType: signType ?? this.signType,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'file': file,
      'signType': signType,
      'isDefault': isDefault,
    };
  }

  factory SignModel.fromMap(Map<String, dynamic> map) {
    return SignModel(
      userId: map['userId'] ?? '',
      file: map['file'] ?? '',
      signType: map['signType'] ?? '',
      isDefault: map['isDefault'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignModel.fromJson(String source) => SignModel.fromMap(json.decode(source));
}
