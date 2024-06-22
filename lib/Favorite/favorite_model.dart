class Favorite {
  final int productId;
  final String productName;
  final String imageUrl;
  final String description;
  final double price;
  final List<Map<String, dynamic>> reviews;

  Favorite({
    required this.productId,
    required this.productName,
    required this.imageUrl,
    required this.description,
    required this.reviews,
    required this.price,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      productId: json['productId'] ?? 0,
      productName: json['productName'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      description: json['description'] ?? "",
      price: (json['price'] as num).toDouble(),
      reviews: List<Map<String, dynamic>>.from(json['reviews'] ?? []),
    );
  }

  List<double> extractReviewRates() {
    return reviews.map((review) => (review['rate'] as num).toDouble()).toList();
  }
}
