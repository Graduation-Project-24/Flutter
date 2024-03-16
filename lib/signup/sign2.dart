import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/login/login_screen.dart';
class Sign_up extends StatelessWidget {
  const Sign_up({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp(BuildContext context) async {
    try {
      var url = Uri.parse("https://www.smarketp.somee.com/api/Account/register");
      var userData = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "dateOfBirth": birthdayController.text,
        "phoneNumber": phoneController.text,
        "password": passwordController.text,
        "email": emailController.text,
      };
      var response = await http.post(
        url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          ModalRoute.withName('login'),
        );
      } else {
        // Handle failure
        print("Signup failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      // Handle network or other errors
      print("Error: $e");
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/Sign up.png"),
                const Text(
                  "Welcome To Smarket",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 54, 74, 90),
                  ),
                ),
                const Text(
                  "Ship Smarter Today",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 54, 74, 90),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "First name",
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Last name",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Phone",
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: birthdayController,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.date_range),
                          hintText: "Birthday",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Password",
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    await signUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 255, 157, 11),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.add_box_outlined, color: Colors.black),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(186, 213, 226, 234),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(Icons.login, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 

