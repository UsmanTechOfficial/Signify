import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';

class PickedFileModel extends Equatable {
  final String name;
  final DateTime date;
  final Uint8List bytes;
  final XFile xFile;

  const PickedFileModel(
      {required this.name,
      required this.date,
      required this.bytes,
      required this.xFile});

  @override
  List<Object?> get props => [name, date, bytes, xFile];
}
