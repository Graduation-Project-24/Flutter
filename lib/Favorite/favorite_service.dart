import 'package:http/http.dart' as http;
import 'dart:convert';
import 'favorite_model.dart';

class FavoriteService {
  static Future<List<Favorite>> getFavorites(String token) async {
    final url = 'https://www.smarketp.somee.com/api/Favorite/GetFavorites';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Favorite.fromJson(item)).toList();
    } else {
      print('Failed to load favorites');
      throw Exception('Failed to load favorites');
    }
  }

  static Future<void> removeFromFavorites(int productId, String token) async {
    final url = 'https://www.smarketp.somee.com/api/Favorite/Delete';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'productId': productId}),
    );

    if (response.statusCode != 200) {
      print('Failed to remove from favorites');
    }
  }

  
}
