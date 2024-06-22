import 'package:http/http.dart' as http;
import 'package:linked_all_pages/url.dart';
import 'dart:convert';
import 'favorite_model.dart';

class FavoriteService {
  static Future<List<Favorite>> getFavorites(String token) async {
    String url = URL();
    try {
      final response = await http.get(
        Uri.parse('$url/Favorite/GetFavorites'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => Favorite.fromJson(item)).toList();
      } else {
        print('Failed to load favorites: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load favorites');
      }
    } catch (error) {
      print('Error during fetching favorites: $error');
      rethrow;
    }
  }

  static Future<void> removeFromFavorites(int productId, String token) async {
    final url = URL();
    try {
      final response = await http.post(
        Uri.parse('$url/Favorite/Delete'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId}),
      );

      if (response.statusCode != 200) {
        print('Failed to remove from favorites: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to remove favorite');
      }
    } catch (error) {
      print('Error during removing from favorites: $error');
      rethrow;
    }
  }
}
