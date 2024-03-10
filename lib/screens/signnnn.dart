import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/home_screen.dart';
import 'package:linked_all_pages/screens/login.dart';
import 'package:linked_all_pages/screens/onboard_screen.dart';

void main() {
  runApp(signup());
}

class signup extends StatelessWidget {
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
        body: Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/Sign up.png"),
            const Text("Welcome To Smarket",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 54, 74, 90))),
            const Text("Ship Smarter Today",
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 54, 74, 90),
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "First name",
                      hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "Last name",
                      hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                ),
              )
            ]),
            const SizedBox(
              height: 10,
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
            Row(children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.phone),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.date_range),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "Birthday",
                      hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                ),
              )
            ]),
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
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 157, 11)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Create Account",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.add_box_outlined,
                          color: Color.fromARGB(255, 0, 0, 0))
                    ],
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return login();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(186, 213, 226, 234)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.login, color: Colors.black)
                    ],
                  ),
                )),
          ]),
        ),
      ),
    ));
  }
}
