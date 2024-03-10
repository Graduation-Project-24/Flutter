import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/login.dart';

// class otp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: test(),
//     );
//   }
// }

// ignore: camel_case_types
class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

// ignore: camel_case_types
class _otpState extends State<otp> {
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
            Image.asset('assets/Login.png'),
            const Text("Welcome To Smarket",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff364a5a))),
            const SizedBox(
              height: 10,
            ),
            const Text("Verification Requird",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff364a5a))),
            SizedBox(
              height: 50,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "To continue, complete this ",
                style: TextStyle(
                    color: Color(0xff9D9D9D),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              //padding: EdgeInsets.only(right: 50),
              child: Text(
                "Verification step. We have sent a One ",
                style: TextStyle(
                    color: Color(0xff9D9D9D),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Time Password (OTP) to the email",
                  style: TextStyle(
                      color: Color(0xff9D9D9D),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20),
                child: const Text(
                  "(Email).Please Enter it below.",
                  style: TextStyle(
                      color: Color(0xff9D9D9D),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
            Container(
                margin: const EdgeInsets.all(2),
                height: 40,
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(90, 157, 157, 157))),
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Color(0xff9D9D9D),
                      hintText: "Enter OTP",
                      hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                )),
            SizedBox(
              height: 80,
            ),
            Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 25, left: 130),
                child: Row(children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend OTP...",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ]),
              ),
            ),
            Container(
              width: 450,
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return login();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 157, 11)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )),
            )
          ],

          //Image.asset("Login.png")
        ),
      ),
    ));
  }
}
