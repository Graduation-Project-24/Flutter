import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Categories extends StatelessWidget {
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
    final response = await http
        .get(Uri.parse('https://www.smarketp.somee.com/api/Category'));

    if (response.statusCode == 200) {
      // Convert the data into a list of maps
      final List<dynamic> responseData = json.decode(response.body);
      categories = List<Map<String, dynamic>>.from(responseData);

      // Print categories to verify the success of the API call
      print(categories);

      // Rebuild the UI once the data is loaded
      setState(() {});
    } else {
      // If the API call fails, print the status code
      print('Failed to load categories. Status code: ${response.statusCode}');
    }
  }

  // Function to fetch category details based on the category ID
  Future<void> fetchCategoriesDetails(int categoryId) async {
    final response = await http.get(Uri.parse(
        'https://www.smarketp.somee.com/api/Category/Details/$categoryId'));

    if (response.statusCode == 200) {
      // Convert the data into a Map
      final Map<String, dynamic> categoryDetails = json.decode(response.body);

      // Print category details to verify the success of the API call
      print(categoryDetails);

      // You can use categoryDetails here to display category details
    } else {
      // If the API call fails, print the status code
      print(
          'Failed to load category details. Status code: ${response.statusCode}');
    }
  }

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
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
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
              height: 90,
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
                      categories[index]['image']['url'],
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    categories[index]['name'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff263238),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // return Row(
          //   children: [
          //     for (var index = startIndex;
          //         index < endIndex && index < categories.length;
          //         index++)
          //       Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.all(4),
          //           child: GestureDetector(
          //             onTap: () {
          //               fetchCategoriesDetails(categories[index]['id']);
          //             },
          //             child: Container(
          //               height: 160,
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(8),
          //               ),
          //               child: Column(
          //                 children: [
          //                   SizedBox(
          //                     height: 10,
          //                   ),
          //                   ClipOval(
          //                     child: Image.network(
          //                       categories[index]['image']['url'],
          //                       height: 80,
          //                       width: 80,
          //                       fit: BoxFit.cover,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     height: 20,
          //                   ),
          //                   Center(
          //                     child: Text(
          //                       categories[index]['name'],
          //                       style: const TextStyle(
          //                         fontSize: 14,
          //                         fontWeight: FontWeight.bold,
          //                         color: Color(0xff263238),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //   ],
          // );
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
  runApp(Categories());
}
