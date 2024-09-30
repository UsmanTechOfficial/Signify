// Document Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'document_user_model.dart';
import 'recipinet_model.dart';

class DocumentModel extends Equatable {
  final String title;
  final String message;
  final String userId;
  final Map<String, dynamic> fieldsData;
  final String file;
  final List<DocumentUserModel> documentUsers;
  final List<RecipientModel> recipients;

  const DocumentModel({
    required this.title,
    required this.message,
    required this.userId,
    required this.fieldsData,
    required this.file,
    required this.documentUsers,
    required this.recipients,
  });

  @override
  List<Object?> get props => [title, message, userId, fieldsData, file, documentUsers, recipients];

  DocumentModel copyWith({
    String? title,
    String? message,
    String? userId,
    Map<String, dynamic>? fieldsData,
    String? file,
    List<DocumentUserModel>? documentUsers,
    List<RecipientModel>? recipients,
  }) {
    return DocumentModel(
      title: title ?? this.title,
      message: message ?? this.message,
      userId: userId ?? this.userId,
      fieldsData: fieldsData ?? this.fieldsData,
      file: file ?? this.file,
      documentUsers: documentUsers ?? this.documentUsers,
      recipients: recipients ?? this.recipients,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'message': message,
      'userId': userId,
      'fieldsData': fieldsData,
      'file': file,
      'documentUsers': documentUsers.map((x) => x.toMap()).toList(),
      'recipients': recipients.map((x) => x.toMap()).toList(),
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      title: map['title'] ?? '',
      message: map['message'] ?? '',
      userId: map['userId'] ?? '',
      fieldsData: Map<String, dynamic>.from(map['fieldsData']),
      file: map['file'] ?? '',
      documentUsers: List<DocumentUserModel>.from(
          map['documentUsers']?.map((x) => DocumentUserModel.fromMap(x))),
      recipients:
          List<RecipientModel>.from(map['recipients']?.map((x) => RecipientModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) => DocumentModel.fromMap(json.decode(source));
}
