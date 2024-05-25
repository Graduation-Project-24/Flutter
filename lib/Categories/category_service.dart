import 'package:http/http.dart' as http;
import 'package:linked_all_pages/url.dart';
import 'dart:convert';
import 'category_model.dart';

class CategoryService {
  static Future<List<CategoryModel>> fetchCategories() async {
    String url = URL();
    final response = await http.get(Uri.parse('$url/Category'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      List<CategoryModel> categories = responseData
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList();
      return categories;
    } else {
      // If the API call fails, return an empty list
      print('Failed to load categories. Status code: ${response.statusCode}');
      return [];
    }
  }
}
