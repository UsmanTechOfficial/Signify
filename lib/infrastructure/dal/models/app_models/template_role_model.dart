// TemplateRole Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TemplateRoleModel extends Equatable {
  final String name;
  final int signingOrder;

  const TemplateRoleModel({
    required this.name,
    required this.signingOrder,
  });

  @override
  List<Object?> get props => [name, signingOrder];

  TemplateRoleModel copyWith({
    String? name,
    int? signingOrder,
  }) {
    return TemplateRoleModel(
      name: name ?? this.name,
      signingOrder: signingOrder ?? this.signingOrder,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'signingOrder': signingOrder,
    };
  }

  factory TemplateRoleModel.fromMap(Map<String, dynamic> map) {
    return TemplateRoleModel(
      name: map['name'] ?? '',
      signingOrder: map['signingOrder'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TemplateRoleModel.fromJson(String source) =>
      TemplateRoleModel.fromMap(json.decode(source));
}
