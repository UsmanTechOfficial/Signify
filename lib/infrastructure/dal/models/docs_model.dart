import 'package:equatable/equatable.dart';

class DocsModel extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

//<editor-fold desc="Data Methods">
  const DocsModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  String toString() {
    return 'DocsModel{ albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl,}';
  }

  factory DocsModel.empty() {
    return const DocsModel(
      albumId: 0,
      id: 0,
      title: '',
      url: '',
      thumbnailUrl: '',
    );
  }

  DocsModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return DocsModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory DocsModel.fromMap(Map<String, dynamic> map) {
    return DocsModel(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];

//</editor-fold>
}
