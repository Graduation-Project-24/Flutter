import 'package:flutter/material.dart';
import 'package:linked_all_pages/Widgets/product_card.dart';
import 'package:linked_all_pages/productDetails/product_details_screen.dart';
import 'package:linked_all_pages/screens/profile.dart';

import '../shop/search_screen.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key, required String token});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductSearchPage()));
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
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => profile()));
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
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/fashion 1.png'),
                      ),
                      const Text('Apparel')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/fashion 1.png'),
                      ),
                      const Text('Apparel')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/fashion 1.png'),
                      ),
                      const Text('Apparel')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/fashion 1.png'),
                      ),
                      const Text('Apparel')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/fashion 1.png'),
                      ),
                      const Text('Apparel')
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/fashion 1.png'),
                      ),
                      const Text('Apparel')
                    ],
                  ),
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
                                  builder: (context) =>
                                      const ProductDetailsWidget(
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
                                  builder: (context) =>
                                      const ProductDetailsWidget(
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
                                  builder: (context) =>
                                      const ProductDetailsWidget(
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
                                  builder: (context) =>
                                      const ProductDetailsWidget(
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
                                  builder: (context) =>
                                      const ProductDetailsWidget(
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
                                  builder: (context) =>
                                      const ProductDetailsWidget(
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
