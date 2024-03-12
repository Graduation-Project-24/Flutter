import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../screens/edit.dart';
import '../screens/home_screen.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _searchResults = [];

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      String apiUrl =
          'https://www.smarketp.somee.com/api/Product/GetProductsBySearch?searchTerm=$query';
      http.get(Uri.parse(apiUrl)).then((response) {
        if (response.statusCode == 200) {
          List<dynamic> responseData = json.decode(response.body);
          setState(() {
            _searchResults = responseData;
          });
        } else {
          throw Exception('Failed to load data');
        }
      }).catchError((error) {
        print('Error fetching search results: $error');
      });
    } else {
      // If the query is empty, clear the search results
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const HomeScreen();
              }));
            },
            icon: const Icon(Icons.chevron_left, color: Colors.white)),
        centerTitle: true,
        title: const Text(
          "search",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return edit();
                }));
              },
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white))
        ],
        backgroundColor: const Color(0xff414E56),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: _debounceSearch,
                    decoration: InputDecoration(
                        hintText: "Search for products",
                        hintStyle: const TextStyle(color: Color(0xffBABABA)),
                        prefixIcon:
                            const Icon(Icons.search, color: Color(0xffBABABA)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffBABABA), width: 2),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 2),
                  child: const Text(
                    "Results",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final result = _searchResults[index];
                return ListTile(
                  leading: Image.network(result['imageUrl']),
                  title: Text(result['name']),
                  // subtitle: Text(result['description']),
                  trailing: IconButton(
                    onPressed: () {
                      // Handle more options
                    },
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Timer? _debounce;

  void _debounceSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }
}
