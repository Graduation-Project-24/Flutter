import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/screens/login.dart';




class Changepassword2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  Future<void> changePassword() async {
    final String apiUrl =
        "https://www.smarketp.somee.com/api/Account/ChangePassword";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          "email": emailController.text,
          "currentPassword": currentPasswordController.text,
          "newPassword": newPasswordController.text,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        // Password changed successfully
        // You can handle the success scenario here
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return login();
        }));
      } else {
        // Password change failed
        // You can handle the failure scenario here
        print("Password change failed. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      // Handle any network or unexpected errors
      print("Error during password change: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/Login.png"),
              const Text(
                "Welcome To Smarket",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff364a5a),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Change password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff364a5a),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(2),
                height: 40,
                child: TextFormField(
                  controller: emailController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(90, 157, 157, 157)),
                    ),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Color(0xff9D9D9D),
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Color(0xff9D9D9D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                height: 40,
                child: TextFormField(
                  controller: currentPasswordController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(90, 157, 157, 157)),
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                    prefixIconColor: Color(0xff9D9D9D),
                    hintText: "Current Password",
                    hintStyle: TextStyle(
                        color: Color(0xff9D9D9D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                height: 40,
                child: TextFormField(
                  controller: newPasswordController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(90, 157, 157, 157)),
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                    prefixIconColor: Color(0xff9D9D9D),
                    hintText: "New Password",
                    hintStyle: TextStyle(
                        color: Color(0xff9D9D9D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                width: 450,
                padding: const EdgeInsets.only(top: 50, bottom: 10),
                child: ElevatedButton(
                  onPressed: changePassword,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFAA933)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
