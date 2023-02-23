class Category {
  late String name;
  late String description;
  late String filePath;

  Category(
      {required this.name, required this.description, required this.filePath});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['filePath'] = filePath;
    return data;
  }

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    filePath = json['filePath'];
  }
}
