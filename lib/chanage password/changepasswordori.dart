import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/login.dart';

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

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
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Login.png",
            ),
            const Text("Welcome To Smarket",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff364a5a))),
            const SizedBox(
              height: 10,
            ),
            const Text("Change password",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff364a5a))),
            const SizedBox(
              height: 50,
            ),
            Container(
                margin: const EdgeInsets.all(2),
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.lock_outline),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Color(0xff9D9D9D),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                )),
            // ignore: avoid_unnecessary_containers
            Container(
                margin: const EdgeInsets.all(2),
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.lock_outline),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "current Password",
                      hintStyle: TextStyle(
                          color: Color(0xff9D9D9D),
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                )),
            Container(
                margin: const EdgeInsets.all(2),
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.lock_outline),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "new Password",
                      hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                )),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: 450,
              padding: const EdgeInsets.only(top: 50, bottom: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return login();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFAA933)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Confirm",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
