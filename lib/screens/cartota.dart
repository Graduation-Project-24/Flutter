import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/forget1.dart';
import 'checkout_1.dart';

class chart extends StatelessWidget {
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
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => forget())); // change to home
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              )),
          centerTitle: true,
          title: const Text(
            "Shopping chart",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                        width: 80,
                        height: 80,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/product.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180,
                            child: const Text(
                              'TMA-2 Comfort Wireless \n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            child: const Text("USD 350",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white),
                                child: Stack(children: const [
                                  Icon(
                                    Icons.remove,
                                  )
                                ]),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(" 1 "),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white),
                                child: Stack(children: const [Icon(Icons.add)]),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete_outline))
                            ],
                          ),
                        ])
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: 80,
                        height: 80,
                        decoration: ShapeDecoration(
                          color: const Color(0xCCD5E2EA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Image.asset('assets/image 5.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180,
                            child: const Text(
                              'TMA-2 Comfort Wireless \n',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            child: const Text("USD 270",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white),
                                child: Stack(children: const [
                                  Icon(
                                    Icons.remove,
                                  )
                                ]),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(" 1 "),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white),
                                child: Stack(children: const [Icon(Icons.add)]),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete_outline))
                            ],
                          ),
                        ])
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 380,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: 180,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => check1()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFAA933)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("Proceed to Checkout",
                            style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          width: 132,
                        ),
                        Icon(Icons.chevron_right, color: Colors.white),
                      ],
                    ),
                  )),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   width: 180,
            //   child: ElevatedButton(
            //       onPressed: () {
            //         Navigator.pushReplacement(context,
            //             MaterialPageRoute(builder: (context) => HomeWidget()));
            //       },
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: const Color(0xffFAA933)),
            //       child: Center(
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: const [
            //             Text("Back",
            //                 style: TextStyle(
            //                     color: Color(0xffffffff),
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w700)),
            //             SizedBox(
            //               width: 132,
            //             ),
            //             Icon(Icons.chevron_right, color: Colors.white),
            //           ],
            //         ),
            //       )),
            // ),
          ],
        ));
  }
}
