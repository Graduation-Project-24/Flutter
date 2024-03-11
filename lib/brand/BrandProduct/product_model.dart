class Product {
  final String name;
  final String description;
  final String imageurl;
  final String subcategoryname;
  final String brandname;
  // Add more fields as needed

  Product({
    required this.name,
    required this.description,
    required this.imageurl,
    required this.brandname,
    required this.subcategoryname,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'],
        description: json['description'],
        subcategoryname: json['subCategoryName'],
        imageurl: json['imageUrl'],
        brandname: json['brandName']);
  }
}
