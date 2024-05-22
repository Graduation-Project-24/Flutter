import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cart_model.dart';

class CartService {
  final String baseUrl = 'https://www.smarketp.somee.com/api/Order';

  Future<List<CartItem>> getCartItems(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/GetShoppingCartbyUser'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final packagesJson = jsonBody['packages'] as List<dynamic>;
      return packagesJson
          .map((packageJson) => CartItem.fromJson(packageJson))
          .toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  Future<void> addToCart(String token, int packageId, int quantity) async {
    final response = await http.post(
      Uri.parse('$baseUrl/AddToCart'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'packageId': packageId,
        'quantity': quantity,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add item to cart');
    }
  }

  Future<void> removeFromCart(String token, int productId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/RemoveFromCart?productId=$productId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'packageId': productId,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to remove item from cart');
    }
  }
}
