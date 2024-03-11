import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Brand {
  final String name;
  final String imageUrl;
  final int id;

  Brand({required this.name, required this.imageUrl, required this.id});
}

class BrandModel extends ChangeNotifier {
  List<Brand> _brands = [];

  List<Brand> get brands => _brands;

  Future<void> fetchBrands() async {
    final response =
        await http.get(Uri.parse('https://www.smarketp.somee.com/api/Brand'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _brands = responseData.map((data) {
        return Brand(
          id: data['id'],
          name: data['name'],
          imageUrl: data['image']['url'],
        );
      }).toList();
      notifyListeners();
    } else {
      print('Failed to load Brands. Status code: ${response.statusCode}');
    }
  }
}
