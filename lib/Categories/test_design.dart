// design/test_design.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:linked_all_pages/Categories/category_model.dart';
import 'package:linked_all_pages/screens/cate%20test.dart';
class TestDesign extends StatefulWidget {
  const TestDesign({Key? key});

  @override
  _TestDesignState createState() => _TestDesignState();
}

class _TestDesignState extends State<TestDesign> {
  late List<CategoryModel> categories;

  @override
  void initState() {
    super.initState();
    // Call the function to fetch category data
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final response =
        await http.get(Uri.parse('https://www.smarketp.somee.com/api/Category'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      categories = responseData
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList();

      // Print categories to verify the success of the API call
      print(categories);

      // Rebuild the UI once the data is loaded
      setState(() {});
    } else {
      // If the API call fails, print the status code
      print('Failed to load categories. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TestDesignWidget(categories: categories);
  }
}

class TestDesignWidget extends StatelessWidget {
  const TestDesignWidget({Key? key, required this.categories}) : super(key: key);

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5F8),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color(0xFFF0F5F8),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ClipOval(
                    child: Image.network(
                      categories[index].image['url'],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff263238),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
