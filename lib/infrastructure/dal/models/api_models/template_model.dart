// Template Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'recipinet_model.dart';
import 'template_role_model.dart';

class TemplateModel extends Equatable {
  final String title;
  final String message;
  final Map<String, dynamic> fieldsData;
  final String file;
  final bool includeSender;
  final List<TemplateRoleModel> templateRoles;
  final List<RecipientModel> recipients;

  const TemplateModel({
    required this.title,
    required this.message,
    required this.fieldsData,
    required this.file,
    required this.includeSender,
    required this.templateRoles,
    required this.recipients,
  });

  @override
  List<Object?> get props =>
      [title, message, fieldsData, file, includeSender, templateRoles, recipients];

  TemplateModel copyWith({
    String? title,
    String? message,
    Map<String, dynamic>? fieldsData,
    String? file,
    bool? includeSender,
    List<TemplateRoleModel>? templateRoles,
    List<RecipientModel>? recipients,
  }) {
    return TemplateModel(
      title: title ?? this.title,
      message: message ?? this.message,
      fieldsData: fieldsData ?? this.fieldsData,
      file: file ?? this.file,
      includeSender: includeSender ?? this.includeSender,
      templateRoles: templateRoles ?? this.templateRoles,
      recipients: recipients ?? this.recipients,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'fieldsData': fieldsData,
      'file': file,
      'includeSender': includeSender,
      'templateRoles': templateRoles.map((x) => x.toMap()).toList(),
      'recipients': recipients.map((x) => x.toMap()).toList(),
    };
  }

  factory TemplateModel.fromMap(Map<String, dynamic> map) {
    return TemplateModel(
      title: map['title'] ?? '',
      message: map['message'] ?? '',
      fieldsData: Map<String, dynamic>.from(map['fieldsData']),
      file: map['file'] ?? '',
      includeSender: map['includeSender'] ?? false,
      templateRoles: List<TemplateRoleModel>.from(
          map['templateRoles']?.map((x) => TemplateRoleModel.fromMap(x))),
      recipients:
          List<RecipientModel>.from(map['recipients']?.map((x) => RecipientModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TemplateModel.fromJson(String source) => TemplateModel.fromMap(json.decode(source));
}
