import 'package:equatable/equatable.dart';
import 'package:file_selector/file_selector.dart';

class SelectedDocumentState extends Equatable {
  final int selectedValue;
  final int selectedSign;
  final List<XFile> loadedFiles;
  final List<DateTime> filesDate;

  const SelectedDocumentState({
    this.selectedValue = 0,
    this.selectedSign = -1,
    this.loadedFiles = const [],
    this.filesDate = const [],
  });

  SelectedDocumentState copyWith({
    int? selectedValue,
    int? selectedSign,
    List<XFile>? loadedFiles,
    List<DateTime>? filesDate,
  }) {
    return SelectedDocumentState(
      selectedValue: selectedValue ?? this.selectedValue,
      selectedSign: selectedSign ?? this.selectedSign,
      loadedFiles: loadedFiles ?? this.loadedFiles,
      filesDate: filesDate ?? this.filesDate,
    );
  }

  @override
  List<Object?> get props =>
      [selectedValue, selectedSign, loadedFiles, filesDate];
}
