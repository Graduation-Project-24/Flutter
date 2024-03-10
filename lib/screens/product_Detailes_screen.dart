import 'package:flutter/material.dart';
import 'package:linked_all_pages/models/product_card_shop_data.dart';
import 'package:linked_all_pages/screens/charttt.dart';
import 'package:linked_all_pages/screens/shopping_screen.dart';

import '../Widgets/product_card.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShoppingScreen()));
            });
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: const Color(0xff384959),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => chart()));
                });
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xff384959),
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(children: [
          ListView(
            children: [
              const Text(
                '350 EGP',
                style: TextStyle(
                    color: Color(0xFFFAA933),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'TMA-2 HD WIRELESS',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0.05,
                    letterSpacing: 0.20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        size: 30,
                        Icons.favorite_border,
                        color: Color.fromARGB(255, 196, 56, 140),
                      )),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 400,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(
                    //height: 390,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      'assets/image 6.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      //height: 390,
                      color: const Color(0xFFF6F6F6),
                      child: Image.asset(
                        'assets/image7.png',
                        scale: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ]),
              ),
              const Text('Review  (102)'),
              const SizedBox(
                height: 300,
              ),
              Container(
                color: const Color(0xFFF6F6F6),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Another Product',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  ProductCard('assets/img.png', 'name', '199'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  ProductCard('assets/img.png', 'name', '199'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  ProductCard('assets/img.png', 'name', '199'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFAA933)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                //color: Color(0xFFFAA933),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return chart();
                  }));
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Add In cart',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
