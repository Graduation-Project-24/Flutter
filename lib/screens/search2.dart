import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/edit.dart';
import 'package:linked_all_pages/screens/home_screen.dart';

// ignore: camel_case_types
class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

// ignore: camel_case_types
class _searchState extends State<search> {
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: const Text(
            "search",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return edit();
                  }));
                },
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.white))
          ],
          backgroundColor: const Color(0xff414E56),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        body: ListView(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  onTap: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  decoration: InputDecoration(
                      hintText: "search head phone",
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
                    "popular product",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
                      SizedBox(
                          width: 180,
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(children: []),
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
                                const SizedBox(width: 10),
                                const Text('86 Reviews',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ]))
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))
                ],
              ))
              //----------------------------------------------------------------------------------
              ,
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
                      SizedBox(
                          width: 180,
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(children: []),
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
                                const SizedBox(width: 10),
                                const Text('86 Reviews',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ]))
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))
                ],
              )),
              //-----------------------------------------------------------------------------------
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
                      SizedBox(
                          width: 180,
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(children: []),
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
                                const SizedBox(width: 10),
                                const Text('86 Reviews',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ]))
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))
                ],
              )),

              //----------------------------------------------------------------------------
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
                      SizedBox(
                          width: 180,
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(children: []),
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
                                const SizedBox(width: 10),
                                const Text('86 Reviews',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ]))
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))
                ],
              )),
            ]),
          )
        ]));
  }
}

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: (() {}), icon: const Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (() {}), icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

uildActions(BuildContext context) {
  return [IconButton(onPressed: (() {}), icon: const Icon(Icons.close))];
}

@override
Widget? buildLeading(BuildContext context) {
  return IconButton(onPressed: (() {}), icon: const Icon(Icons.arrow_back));
}

@override
Widget buildResults(BuildContext context) {
  // TODO: implement buildResults
  throw UnimplementedError();
}

@override
Widget buildSuggestions(BuildContext context) {
  // TODO: implement buildSuggestions
  throw UnimplementedError();
}
