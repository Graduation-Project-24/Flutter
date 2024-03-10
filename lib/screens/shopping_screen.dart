import 'package:flutter/material.dart';
import 'package:linked_all_pages/Widgets/product_card_shop.dart';
import 'package:linked_all_pages/models/product_card_shop_data.dart';
import 'package:linked_all_pages/screens/charttt.dart';
import 'package:linked_all_pages/screens/search2.dart';
import 'home_screen.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  List<ProductCardData> productcard = [
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
    ProductCardData(
        image: 'assets/product.png',
        name: 'TMA-2 HD Wireless',
        price: '350',
        rate: '4.8',
        review: '90'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F5F8),
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
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Shop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              height: 0.08,
              letterSpacing: 0.20,
            ),
          ),
        ),
        backgroundColor: const Color(0xff414E56),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const search();
                      }));
                    },
                    label: const Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    onPressed: () {},
                    label: const Text(
                      'Filter',
                      style: TextStyle(color: Color(0xff414E56)),
                    ),
                    icon: const Icon(
                      Icons.format_align_left_sharp,
                      color: Color(0xff414E56),
                    ),
                  ),
                ],
              ),
            )),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return chart();
                }));
              },
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white))
        ],
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: productcard.length,
          itemBuilder: (context, index) =>
              CardData(pageIndex: index, CardShopData: productcard)),
    );
  }
}
