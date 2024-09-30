// Notification Model
import 'dart:convert';

import 'package:equatable/equatable.dart';

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
