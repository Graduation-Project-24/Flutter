import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:linked_all_pages/shop/shop_product_model.dart';
import 'package:linked_all_pages/url.dart';

Future<List<Product>> fetchProducts() async {
  String url = URL();
  final response = await http.get(Uri.parse('$url/Product'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => Product.fromJson(item)).toList();
  } else {
    throw Exception('Failed to fetch products');
  }
}
