class NewFolderModel {
  final String name;
  final String slug;
  final List<TemplatesModel> templates;

  NewFolderModel({required this.name, required this.slug, required this.templates});
}

class TemplatesModel {
  final String name;
  final String description;

  TemplatesModel({required this.name, required this.description});
}
