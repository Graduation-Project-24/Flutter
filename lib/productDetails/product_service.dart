import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchProductDetails(int productId) async {
  final response = await http.get(Uri.parse(
      'https://www.smarketp.somee.com/api/Product/Details/$productId'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load product details');
  }
}

class ProductService {
  static Future<void> addToFavorites(int productId, String token) async {
    final url = 'https://www.smarketp.somee.com/api/Favorite/Add';
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'productId': productId});
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      // Handle success
      print('Product added to favorites successfully');
    } else {
      // Handle error
      throw Exception('Failed to add product to favorites');
    }
  }

  static Future<void> removeFromFavorites(int productId, String token) async {
    final url = 'https://www.smarketp.somee.com/api/Favorite/Delete';
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'productId': productId});
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      // Handle success
      print('Product removed from favorites successfully');
    } else {
      // Handle error
      throw Exception('Failed to remove product from favorites');
    }
  }
}
