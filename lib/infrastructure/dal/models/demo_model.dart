import 'dart:convert';

import 'package:equatable/equatable.dart';

// Template Model
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

// TemplateRole Model
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

// Recipient Model
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

// Document Model
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

// DocumentUser Model
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

// Sign Model
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

// Notification Model
class NotificationModel extends Equatable {
  final String id;
  final String message;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.message,
    required this.isRead,
  });

  @override
  List<Object?> get props => [id, message, isRead];

  NotificationModel copyWith({
    String? id,
    String? message,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      message: message ?? this.message,
      isRead: isRead ?? this.isRead,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'isRead': isRead,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] ?? '',
      message: map['message'] ?? '',
      isRead: map['isRead'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source));
}

// Account Model
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

// Auth Models

// SignUp Model
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

// SignIn Model
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

// ForgotPassword Model
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
