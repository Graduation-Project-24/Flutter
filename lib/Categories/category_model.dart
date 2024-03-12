// category_model.dart
class CategoryModel {
  final String name;
  final Map<String, dynamic> image;

  CategoryModel({required this.name, required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      image: json['image'],
    );
  }
}
