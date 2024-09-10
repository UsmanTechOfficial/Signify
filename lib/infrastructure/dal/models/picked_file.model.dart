import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class PickedFileModel extends Equatable {
  final String name;
  final DateTime date;
  final Uint8List bytes;

  const PickedFileModel({
    required this.name,
    required this.date,
    required this.bytes,
  });
  
  @override
  List<Object?> get props => [name, date, bytes];
}
