import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/brand/BrandProduct/product_model.dart';

class ProductScreen extends StatefulWidget {
  final int brandId;

  const ProductScreen({Key? key, required this.brandId}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Product> products;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(
        'https://www.smarketp.somee.com/api/Product/ByBrand/${widget.brandId}'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        products = responseData.map((json) => Product.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      // ignore: avoid_print
      print('Failed to load products. Status code: ${response.statusCode}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : products != null
              ? ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      products[index].name.length > 35
                          ? '${products[index].name.substring(0, 35)}..'
                          : products[index].name,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].description.length > 35
                              ? '${products[index].description.substring(0, 35)}..'
                              : products[index].description,
                        ),
                        Text('Subcategory: ${products[index].subcategoryname}'),
                        Text('Brand: ${products[index].brandname}'),
                      ],
                    ),
                    leading: FutureBuilder<Uint8List>(
                      future: getImage(products[index].imageurl),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Icon(Icons.error);
                        } else {
                          return Image.memory(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          );
                        }
                      },
                    ),
                  ),
                )
              : const Center(
                  child: Text('Failed to load products.'),
                ),
    );
  }

  Future<Uint8List> getImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }
}
