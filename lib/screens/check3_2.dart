import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/Image2.png'),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 15),
          child: Column(
            children: [
              Center(
                  child: Container(
                width: 284,
                height: 26.5,
                alignment: Alignment.center,
                child: const Text(" Your order has been ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0Xff1C1B1B))),
              )),
              Container(
                  width: 284,
                  height: 26.5,
                  alignment: Alignment.center,
                  child: const Text(
                    " Denied ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color(0Xff1C1B1B)),
                  )),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 120, top: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 400,
                    height: 21,
                    child: const Text(
                      "there is an error occur while payment, take some ",
                      style: TextStyle(
                          color: Color(0xff6F7384),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    )),
                Container(
                    alignment: Alignment.center,
                    width: 328,
                    height: 21,
                    child: const Text(
                      "rest and make an order again ",
                      style: TextStyle(
                          color: Color(0xff6F7384),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
          ),
        ),
        Container(
            width: 261.5384,
            height: 60.5,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(15),
                    backgroundColor: Color(0Xff354249)),
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
