import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'category_model.dart';
import 'category_service.dart';

class CategoryScreen extends StatefulWidget {
  final String token; // Add token parameter to CategoryScreen

  const CategoryScreen({required this.token, Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<CategoryModel>> _categoryFuture;

  @override
  void initState() {
    super.initState();
    // Initiate the category fetching process
    _categoryFuture = CategoryService.fetchCategories();
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
              MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(token: widget.token), // Pass token to HomeScreen
              ),
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
      body: FutureBuilder<List<CategoryModel>>(
        future: _categoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for data, show a loading indicator
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If an error occurred during data fetching, display an error message
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // If data is successfully fetched, display the category grid
            List<CategoryModel> categories = snapshot.data ?? [];
            return Padding(
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
            );
          }
        },
      ),
    );
  }
}
