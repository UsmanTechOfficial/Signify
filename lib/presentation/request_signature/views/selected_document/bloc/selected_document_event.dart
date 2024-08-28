import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';

abstract class SelectedDocumentEvent extends Equatable {
  const SelectedDocumentEvent();

  @override
  List<Object?> get props => [];
}

class SelectValueChanged extends SelectedDocumentEvent {
  final int value;

  const SelectValueChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class SignSelected extends SelectedDocumentEvent {
  final int value;

  const SignSelected(this.value);

  @override
  List<Object?> get props => [value];
}

class FileSelected extends SelectedDocumentEvent {
  final XFile file;
  final DateTime fileDate;

  const FileSelected(this.file, this.fileDate);

  @override
  List<Object?> get props => [file, fileDate];
}

class RemoveFile extends SelectedDocumentEvent {
  final int index;

  const RemoveFile(this.index);

  @override
  List<Object?> get props => [index];
}
