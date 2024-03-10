// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/otp.dart';

void main() {
  runApp(forget());
}

class forget extends StatelessWidget {
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ignore: avoid_unnecessary_containers
            Image.asset('assets/Login.png'),
            const Text("Welcome To Smarket",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 54, 74, 90))),
            const Text("Forget Password",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 54, 74, 90),
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 50,
            ),

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(90, 157, 157, 157))),
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Color(0xff9D9D9D),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Color(0xff9D9D9D))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(90, 157, 157, 157))),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                  suffixIconColor: const Color(0xff9D9D9D),
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: const Color(0xff9D9D9D),
                  hintText: "password",
                  hintStyle: const TextStyle(color: Color(0xff9D9D9D))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(90, 157, 157, 157))),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
                  suffixIconColor: const Color(0xff9D9D9D),
                  prefixIcon: const Icon(Icons.lock),
                  prefixIconColor: const Color(0xff9D9D9D),
                  hintText: "Re-enter Password",
                  hintStyle: const TextStyle(color: Color(0xff9D9D9D))),
            ),

            Center(
              child: Container(
                width: 450,
                padding: const EdgeInsets.only(top: 100),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return otp();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 157, 11)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Confim",
                            style: TextStyle(color: Colors.black),
                          ),
                          const Icon(Icons.login, color: Colors.black)
                        ],
                      ),
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
