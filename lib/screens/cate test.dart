import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class categoriesn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late List<Map<String, dynamic>> categories;

  @override
  void initState() {
    super.initState();
    // Call the function to fetch category data
    fetchCategories();
  }

  // Function to fetch categories data from the API
  Future<void> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://www.smarketp.somee.com/api/Category'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Convert the data into a list of maps
        final List<dynamic> responseData = json.decode(response.body);
        categories = List<Map<String, dynamic>>.from(responseData);

        // Print categories to verify the success of the API call
        print('Categories: $categories');
        print(responseData);

        // Rebuild the UI once the data is loaded
        setState(() {});
      } else {
        // If the API call fails, print the status code
        print('Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  // Function to fetch category details based on the category ID
  Future<void> fetchCategoriesDetails(int categoryId) async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.smarketp.somee.com/api/Category/Details/$categoryId'));
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Convert the data into a Map
        final Map<String, dynamic> categoryDetails = json.decode(response.body);

        // Print category details to verify the success of the API call
        print('Category Details: $categoryDetails');

        // Show details in a dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Category Details'),
              content: Column(
                children: [
                  Text('Name: ${categoryDetails['name']}'),
                  Text('Description: ${categoryDetails['description']}'),
                  // Add more details as needed
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      } else {
        // If the API call fails, print the status code
        print(
            'Failed to load category details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching category details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  fetchCategoriesDetails(category['id']);
                },
                child: Column(
                  children: [
                    Image.network(
                      category['imageUrl'] ??
                          'http://res.cloudinary.com/dghjthnqs/image/upload/v1707271248/da-net7/ffq93k7hws7cierasfvj.jpg', // Use local placeholder if imageUrl is null
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category['name'] ??
                          'No Name', // Use default text if name is null
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to Home Screen'),
      ),
    );
  }
}

void main() {
  runApp(categoriesn());
}
