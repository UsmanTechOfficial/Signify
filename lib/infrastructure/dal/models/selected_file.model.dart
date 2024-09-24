import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';

import 'package:image_picker/image_picker.dart';

class SelectedFileModel extends Equatable {
  final String name;
  final DateTime date;
  final Uint8List bytes;
  final XFile xFile;

  const SelectedFileModel({
    required this.name,
    required this.date,
    required this.bytes,
    required this.xFile,
  });

  factory SelectedFileModel.empty() {
    return SelectedFileModel(
      name: '',
      date: DateTime.now(),
      bytes: Uint8List(0),
      xFile: XFile(''),
    );
  }

  SelectedFileModel copyWith({
    String? name,
    DateTime? date,
    Uint8List? bytes,
    XFile? xFile,
  }) {
    return SelectedFileModel(
      name: name ?? this.name,
      date: date ?? this.date,
      bytes: bytes ?? this.bytes,
      xFile: xFile ?? this.xFile,
    );
  }

  @override
  List<Object?> get props => [name, date, bytes, xFile];

  @override
  bool get stringify => true;
}
