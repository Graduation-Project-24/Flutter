import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class category {
  final String name;
  final String imageUrl;

  category({required this.name, required this.imageUrl});
}

class CategoryModel extends ChangeNotifier {
  List<category> _categories = [];

  List<category> get categories => _categories;

  Future<void> fetchCatecories() async {
    final response = await http
        .get(Uri.parse('https://www.smarketp.somee.com/api/Category'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _categories = responseData.map((data) {
        return category(
          name: data['name'],
          imageUrl: data['image'],
        );
      }).toList();
      notifyListeners();
    } else {
      print('Failed to load Brands. Status code: ${response.statusCode}');
    }
  }
}
