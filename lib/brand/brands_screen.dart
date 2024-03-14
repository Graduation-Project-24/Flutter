import 'package:flutter/material.dart';
import 'package:linked_all_pages/brand/BrandProduct/product_screen.dart';
import 'package:linked_all_pages/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'brand_model.dart';

class Brands extends StatelessWidget {
  final String token;

  const Brands({required this.token, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BrandScreen(token: token),
    );
  }
}

class BrandScreen extends StatelessWidget {
  final String token;

  const BrandScreen({required this.token, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD5E2EA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD5E2EA),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(token: token)),
            );
          },
          icon: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text(
          "Brands",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<BrandModel>(
          builder: (context, model, child) {
            if (model.brands.isEmpty) {
              model.fetchBrands();
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: model.brands.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductScreen(
                          brandId: model.brands[index].id,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                model.brands[index].imageUrl,
                                fit: BoxFit.fitWidth,
                                height: 100,
                                width: 200,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 35),
                                child: Text(
                                  model.brands[index].name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff263238),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
