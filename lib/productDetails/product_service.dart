import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linked_all_pages/url.dart';

Future<Map<String, dynamic>> fetchProductDetails(int productId) async {
  String url = URL();
  final response = await http.get(Uri.parse('$url/Product/Details/$productId'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load product details');
  }
}

class ProductService {
  static Future<void> addToFavorites(int productId, String token) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    String url = URL();
    final body = jsonEncode({'productId': productId});
    final response = await http.post(Uri.parse('$url/Favorite/Add'),
        headers: headers, body: body);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final jsonResponse = json.decode(response.body);
        final message = jsonResponse['message'];
        _showToast(message);
      } else {
        throw Exception('Empty response received');
      }
    } else {
      throw Exception(
          'Failed to add product to cart. Status code: ${response.statusCode}');
    }
  }

  static Future<void> addToCart(
      int? productId, String token, int quantity) async {
    if (productId == null) {
      throw ArgumentError('productId cannot be null');
    }

    final url = 'https://www.smarketp.somee.com/api/Order/AddToCart';
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode(
      {'productId': productId, 'quantity': 1},
    );
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        final jsonResponse = json.decode(response.body);
        final message = jsonResponse['message'];
        _showToast(message);
      } else {
        throw Exception('Empty response received');
      }
    } else {
      throw Exception(
          'Failed to add product to cart. Status code: ${response.statusCode}');
    }
  }

  static void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      backgroundColor: Color.fromARGB(255, 255, 157, 0),
      textColor: Colors.white,
    );
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

  static Future<bool> checkFavorite(int productId, String token) async {
    final url = Uri.parse(
        'https://www.smarketp.somee.com/api/Favorite/CheckFavorite?productId=$productId');
    final response = await http.get(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final bool isFavorite = json.decode(response.body);
      return isFavorite;
    } else {
      throw Exception('Failed to check favorite status');
    }
  }
}
