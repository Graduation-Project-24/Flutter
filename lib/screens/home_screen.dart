import 'package:flutter/material.dart';
import 'package:linked_all_pages/Widgets/home_widget.dart';
import 'package:linked_all_pages/productDetails/product_details_screen.dart';
import 'package:linked_all_pages/screens/favorites.dart';
import 'package:linked_all_pages/screens/profile.dart';
import 'package:linked_all_pages/shop/shop_screen.dart';
import '../Categories/category_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'charttt.dart';

class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen({required this.token, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgetPages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize widget pages with HomeWidget and other screens
    widgetPages = [
      HomeWidget(token: widget.token),
      ShoppingScreen(token: widget.token),
      CategoryScreen(token: widget.token),
      favorites(),
      chart(),
      ProductDetailsWidget(token: widget.token),
      profile_screen(token: widget.token)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        backgroundColor: const Color(0xFF414E56),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Shop"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "cart"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFFAA933),
      ),
      body: widgetPages.elementAt(_currentIndex),
    );
  }
}
