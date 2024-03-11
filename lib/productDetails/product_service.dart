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
