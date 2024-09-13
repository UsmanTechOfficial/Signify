import 'package:equatable/equatable.dart';

class FolderModel extends Equatable {
  final String name;
  final String desc;

  const FolderModel({
    required this.name,
    required this.desc,
  });

  FolderModel copyWith({
    String? name,
    String? desc,
  }) {
    return FolderModel(
      name: name ?? this.name,
      desc: desc ?? this.desc,
    );
  }

  @override
  List<Object?> get props => [name, desc];
}

class TemplatesModel extends Equatable {
  final String name;
  final String desc;

  const TemplatesModel({
    required this.name,
    required this.desc,
  });

  TemplatesModel copyWith({
    String? name,
    String? desc,
  }) {
    return TemplatesModel(
      name: name ?? this.name,
      desc: desc ?? this.desc,
    );
  }

  @override
  List<Object?> get props => [name, desc];
}
