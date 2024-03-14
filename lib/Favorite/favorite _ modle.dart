class FavoriteItem {
  final String imageUrl;
  final String description;
  final String price;
  final String rating;
  final int reviews;

  FavoriteItem({
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
      rating: json['rating'],
      reviews: json['reviews'],
    );
  }
}
