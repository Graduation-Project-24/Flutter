class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String brandName;
  final int brandId;
  final String subCategoryName;
  final int subCategoryId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.brandName,
    required this.brandId,
    required this.subCategoryName,
    required this.subCategoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      brandName: json['brandName'],
      brandId: json['brandId'],
      subCategoryName: json['subCategoryName'],
      subCategoryId: json['subCategoryId'],
    );
  }
}
