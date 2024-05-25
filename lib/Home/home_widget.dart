import 'package:flutter/material.dart';
import 'package:linked_all_pages/Categories/category_model.dart';
import 'package:linked_all_pages/Categories/category_service.dart';

import 'package:linked_all_pages/Widgets/product_card.dart';

import 'package:linked_all_pages/productDetails/product_details_screen.dart';

import '../Chatbot/chatbot.dart';
import '../profile_screen/profile_screen.dart';

class HomeWidget extends StatefulWidget {
  final String token;

  const HomeWidget({super.key, required this.token});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late Future<List<CategoryModel>> _categoryFuture;

  @override
  void initState() {
    super.initState();
    //futureData = DataService.fetchData();
    _categoryFuture = CategoryService.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Smarket',
            style: TextStyle(
              color: Color(0xFF263238),
              fontSize: 28,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              height: 0.02,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatbotPage()));
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: const Color(0xFFD5E2EA),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0x60263238)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              height: 35,
              alignment: Alignment.center,
              child: const Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Color(0x60263238),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      ' Search for product',
                      style: TextStyle(
                        color: Color(0x60263238),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                        letterSpacing: 0.20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            profile_screen(token: widget.token)));
              });
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/toka.jpeg')),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        child: ListView(
          children: [
            Container(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset("assets/banner.png"),
                  Image.asset("assets/banner.png"),
                  Image.asset("assets/banner.png")
                ],
              ),
            ),
            const Text(
              'Category',
              style: TextStyle(
                color: Color(0xFF393F42),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  FutureBuilder<List<CategoryModel>>(
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
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                              ),
                              itemCount: categories.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xCCD5E2EA),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    child: Image.network(
                                        categories[index].image['url']),
                                  ),
                                  Text(categories[index].name)
                                ],
                                //  categoryWidget(
                                //     categories[index].image['url'],
                                //     categories[index].name)

                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Container(
                                //     height: 50,
                                //     decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(10),
                                //     ),
                                //     child: Column(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //         ClipOval(
                                //           child: Image.network(
                                //             categories[index].image['url'],
                                //             height: 60,
                                //             width: 60,
                                //             fit: BoxFit.cover,
                                //           ),
                                //         ),
                                //         const SizedBox(height: 8),
                                //         Text(
                                //           categories[index].name,
                                //           textAlign: TextAlign.center,
                                //           style: const TextStyle(
                                //             fontSize: 14,
                                //             fontWeight: FontWeight.bold,
                                //             color: Color(0xff263238),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ),
                            ));
                      }
                    },
                  ),

                  // FutureBuilder<Data>(
                  //   future: futureData,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return Center(child: CircularProgressIndicator());
                  //     } else if (snapshot.hasError) {
                  //       return Center(child: Text('Error: ${snapshot.error}'));
                  //     } else if (snapshot.hasData) {
                  //       print(snapshot.data!.categories.length);
                  //       return GridView.builder(
                  //           gridDelegate:
                  //               SliverGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 1),
                  //           itemCount: snapshot.data!.categories.length,
                  //           itemBuilder: (context, index) {
                  //             final category = snapshot.data!.categories[index];

                  //             return categoryWidget(
                  //                 category.image, category.name);
                  //           });
                  //     } else {
                  //       return Center(child: Text('No data'));
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
            const Text(
              'Recent Product',
              style: TextStyle(
                color: Color(0xFF393F42),
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsWidget(
                                        token: widget.token,
                                        productId: 320,
                                      )));
                        });
                      },
                      child: ProductCard('assets/product.png', 'name', '199')),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsWidget(
                                        token: widget.token,
                                        productId: 320,
                                      )));
                        });
                      },
                      child: ProductCard('assets/product.png', 'name', '199')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsWidget(
                                        token: widget.token,
                                        productId: 320,
                                      )));
                        });
                      },
                      child: ProductCard('assets/product.png', 'name', '199')),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsWidget(
                                        token: widget.token,
                                        productId: 320,
                                      )));
                        });
                      },
                      child: ProductCard('assets/product.png', 'name', '199')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsWidget(
                                        token: widget.token,
                                        productId: 320,
                                      )));
                        });
                      },
                      child: ProductCard('assets/product.png', 'name', '350')),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsWidget(
                                        token: widget.token,
                                        productId: 320,
                                      )));
                        });
                      },
                      child: ProductCard('assets/product.png', 'name', '350')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ProductCard('assets/product.png', 'name', '199'),
                  const Spacer(),
                  ProductCard('assets/product.png', 'name', '199'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ProductCard('assets/img.png', 'name', '199'),
                  const Spacer(),
                  ProductCard('assets/img.png', 'name', '199'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryWidget(String image, String name) {
  return Column(
    children: [
      Container(
        width: 25,
        height: 25,
        decoration: ShapeDecoration(
          color: const Color(0xCCD5E2EA),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Image.network(image),
      ),
      Text(name)
    ],
  );
}
