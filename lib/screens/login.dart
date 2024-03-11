import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/auth_screens/register_screen.dart';
import 'package:linked_all_pages/screens/forget1.dart';
import 'package:linked_all_pages/screens/home_screen.dart';
import 'package:linked_all_pages/shop/shop_screen.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  login({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Login.png",
                // width: 200,
                // height: 200,
              ),
              const Text("Welcome To Smarket",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff364A5A))),
              const Text("Ship Smarter Today",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff364A5A),
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 10,
              ),
              // TextFieldWidget(hintTitle: "Email", type: TextInputType.emailAddress, controller: emailController),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(90, 157, 157, 157))),
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
                        borderSide: BorderSide(
                            color: Color.fromARGB(90, 157, 157, 157))),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye)),
                    suffixIconColor: const Color(0xff9D9D9D),
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: const Color(0xff9D9D9D),
                    hintText: "password",
                    hintStyle: const TextStyle(color: Color(0xff9D9D9D))),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.amber,
                            value: remember,
                            onChanged: (val) {
                              setState(() {
                                remember = val!;
                              });
                            }),
                        const Text("Remember me"),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ShoppingScreen();
                          }));
                        },
                        child: const Text("Forget password?")),
                  ],
                ),
              ),
              Container(
                width: 450,
                padding: const EdgeInsets.only(top: 90, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 157, 11)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Sign in",
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.logout_outlined,
                            color: Color.fromARGB(255, 0, 0, 0))
                      ],
                    )),
              ),
              Container(
                width: 450,
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return RegisterScreen();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(186, 213, 226, 234)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Create Account",
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.add_box_outlined, color: Colors.black)
                      ],
                    )),
              )
            ],

            //Image.asset("Login.png")
          ),
        ),
      ),
    ));
  }
}
