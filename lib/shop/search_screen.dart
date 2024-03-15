import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/screens/forget1.dart';
import 'package:linked_all_pages/shop/shop_screen.dart';
import 'dart:convert';
import '../productDetails/product_details_screen.dart';

class ProductSearchPage extends StatefulWidget {
  final String? token;

  const ProductSearchPage({super.key, this.token});
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
      setState(() {
        _searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return forget(); // change to home
              }));
            },
            icon: const Icon(Icons.chevron_left, color: Colors.white)),
        centerTitle: true,
        title: const Text(
          "search",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return forget(); // make it to shopping
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
                return GestureDetector(
                  onTap: () {
                    // Navigate to product details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsWidget(
                          productId: result['id'],
                          token: widget.token as String,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Container(
                      width: 80,
                      height: 80,
                      child: Image.network(
                        result['imageUrl'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(result['name']),
                    // subtitle: Text(result['description']),
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
