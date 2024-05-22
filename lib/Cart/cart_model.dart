class CartItem {
  final int packageId;
  final String productName;
  final double price;
  final double listPrice;
  final String productImageUrl;
  int count;
  double totalprice;

  CartItem({
    required this.packageId,
    required this.productName,
    required this.price,
    required this.listPrice,
    required this.productImageUrl,
    required this.count,
    this.totalprice = 0,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      packageId: json['productId'],
      productName: json['productName'],
      price: json['price'].toDouble(),
      listPrice: json['listPrice'].toDouble(),
      productImageUrl: json['productImageUrl'],
      count: json['count'],
    );
  }
}
