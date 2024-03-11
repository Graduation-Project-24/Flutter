import 'package:flutter/material.dart';
import 'package:linked_all_pages/shop/shop_screen.dart';

// ignore: camel_case_types
class check3_1 extends StatefulWidget {
  const check3_1({super.key});

  @override
  State<check3_1> createState() => _check3_1State();
}

// ignore: camel_case_types
class _check3_1State extends State<check3_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/Image (1).png'),
        Center(
          child: Container(
              width: 500,
              alignment: Alignment.center,
              child: const Text(
                " Your order has been ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xFF1C1B1B)),
              )),
        ),
        Container(
            width: 500,
            alignment: Alignment.center,
            child: const Text("placed successfully",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Color(0xFF1C1B1B)))),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  child: const Text(
                    "Thank you For Choosing us! Feel Free To Continue ",
                    style: TextStyle(
                        color: Color(0Xff6F7384),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )),
              Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  child: const Text(
                    "Shopping and explore our wide range of Products. ",
                    style: TextStyle(
                        color: Color(0Xff6F7384),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )),
              Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  child: const Text(
                    "Happy shopping! ",
                    style: TextStyle(
                        color: Color(0Xff6F7384),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        Container(
            width: 261.5384,
            height: 55.5,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const ShoppingScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color(0Xff354249)),
                child: const Text(
                  "Continue Shopping",
                  style: TextStyle(
                      color: Color.fromARGB(255, 250, 243, 243),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ))),
      ],
    ));
  }
}
