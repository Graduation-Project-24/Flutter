import 'package:flutter/material.dart';
import 'package:linked_all_pages/Widgets/home_widget.dart';
import 'package:linked_all_pages/screens/categories%20test%20.dart';

import 'package:linked_all_pages/screens/favorites.dart';
import 'package:linked_all_pages/screens/shopping_screen.dart';
import 'charttt.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgetPages = [
    const HomeWidget(),
    ShoppingScreen(),
    Categories(),
    favorites(),
    chart()
  ];
  int _currentIndex = 0;
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
              // if (selectindex == 0) {
              //   // Navigator.push(context,
              //   //     MaterialPageRoute(builder: (context) => HomeScreen()));
              // }
            });
          },
          selectedItemColor: const Color(0xFFFAA933),
        ),
        body: widgetPages.elementAt(_currentIndex)

        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
        //   child: ListView(
        //     children: [
        //       Container(
        //         height: 170,
        //         child: ListView(
        //           scrollDirection: Axis.horizontal,
        //           children: [
        //             Image.asset("assets/banner.png"),
        //             Image.asset("assets/banner.png"),
        //             Image.asset("assets/banner.png")
        //           ],
        //         ),
        //       ),
        //       const Text(
        //         'Category',
        //         style: TextStyle(
        //           color: Color(0xFF393F42),
        //           fontSize: 14,
        //           fontFamily: 'Roboto',
        //           fontWeight: FontWeight.w800,
        //           height: 0,
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(10.0),
        //         child: Row(
        //           children: [
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: ShapeDecoration(
        //                     color: const Color(0xCCD5E2EA),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(8)),
        //                   ),
        //                   child: Image.asset('assets/fashion 1.png'),
        //                 ),
        //                 const Text('Apparel')
        //               ],
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: ShapeDecoration(
        //                     color: const Color(0xCCD5E2EA),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(8)),
        //                   ),
        //                   child: Image.asset('assets/fashion 1.png'),
        //                 ),
        //                 const Text('Apparel')
        //               ],
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: ShapeDecoration(
        //                     color: const Color(0xCCD5E2EA),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(8)),
        //                   ),
        //                   child: Image.asset('assets/fashion 1.png'),
        //                 ),
        //                 const Text('Apparel')
        //               ],
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: ShapeDecoration(
        //                     color: const Color(0xCCD5E2EA),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(8)),
        //                   ),
        //                   child: Image.asset('assets/fashion 1.png'),
        //                 ),
        //                 const Text('Apparel')
        //               ],
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: ShapeDecoration(
        //                     color: const Color(0xCCD5E2EA),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(8)),
        //                   ),
        //                   child: Image.asset('assets/fashion 1.png'),
        //                 ),
        //                 const Text('Apparel')
        //               ],
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Column(
        //               children: [
        //                 Container(
        //                   width: 50,
        //                   height: 50,
        //                   decoration: ShapeDecoration(
        //                     color: const Color(0xCCD5E2EA),
        //                     shape: RoundedRectangleBorder(
        //                         borderRadius: BorderRadius.circular(8)),
        //                   ),
        //                   child: Image.asset('assets/fashion 1.png'),
        //                 ),
        //                 const Text('Apparel')
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       const Text(
        //         'Recent Product',
        //         style: TextStyle(
        //           color: Color(0xFF393F42),
        //           fontSize: 14,
        //           fontFamily: 'Roboto',
        //           fontWeight: FontWeight.w800,
        //           height: 0,
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //         child: Row(
        //           children: [
        //             ProductCard('assets/img.png', 'name', '199'),
        //             const Spacer(),
        //             ProductCard('assets/img.png', 'name', '199'),
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //         child: Row(
        //           children: [
        //             ProductCard('assets/img.png', 'name', '199'),
        //             const Spacer(),
        //             ProductCard('assets/img.png', 'name', '199'),
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //         child: Row(
        //           children: [
        //             ProductCard('assets/img.png', 'name', '199'),
        //             const Spacer(),
        //             ProductCard('assets/img.png', 'name', '199'),
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //         child: Row(
        //           children: [
        //             ProductCard('assets/img.png', 'name', '199'),
        //             const Spacer(),
        //             ProductCard('assets/img.png', 'name', '199'),
        //           ],
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //         child: Row(
        //           children: [
        //             ProductCard('assets/img.png', 'name', '199'),
        //             const Spacer(),
        //             ProductCard('assets/img.png', 'name', '199'),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
