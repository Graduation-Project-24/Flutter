import 'package:flutter/material.dart';
import 'package:linked_all_pages/home/home_widget.dart';

import 'home_screen.dart';

void main() {
  runApp(favorites());
}

class favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: test(),
    );
  }
}

// ignore: camel_case_types
class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

// ignore: camel_case_types
class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) => HomeWidget()));
          //     },
          //     icon: const Icon(Icons.chevron_left, color: Colors.black)),
          centerTitle: true,
          title: const Text(
            "Favorites",
            style: TextStyle(
                color: Color(0xff384959),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Card(
                  child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/52x68"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        width: 180,
                        child: const Text(
                          'A box of Chips that Free of preservatives\n ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Text("USD 270",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Container(
                        width: 180,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Stack(children: []),
                                  ),
                                  const SizedBox(width: 3),
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffFFC120),
                                  ),
                                  const Text(
                                    '4.6',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '86 Reviews',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Color(0xffFF007A),
                    size: 50,
                  )
                ],
              )),
              Card(
                  child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/52x68"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        width: 180,
                        child: const Text(
                          'A box of Chips that Free of preservatives\n ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Text("USD 270",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Container(
                        width: 180,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Stack(children: []),
                                  ),
                                  const SizedBox(width: 3),
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffFFC120),
                                  ),
                                  const Text(
                                    '4.6',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '86 Reviews',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Color(0xffFF007A),
                    size: 50,
                  )
                ],
              )),
              Card(
                  child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/52x68"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 10),
                        width: 180,
                        child: const Text(
                          'A box of Chips that Free of preservatives\n ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(bottom: 5),
                        child: const Text("USD 270",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      Container(
                        width: 180,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: Stack(children: []),
                                  ),
                                  const SizedBox(width: 3),
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xffFFC120),
                                  ),
                                  const Text(
                                    '4.6',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '86 Reviews',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Color(0xffFF007A),
                    size: 50,
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
