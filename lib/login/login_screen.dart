import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/Widgets/home_widget.dart';
import 'package:linked_all_pages/login/login_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Screen2 extends StatefulWidget {
  const Login_Screen2({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen2> {
  bool remember = false;
  late bool isSecurePassword = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if the user is already logged in
    _checkLoggedIn();
  }

  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      // If token exists, navigate to HomeScreen directly
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeWidget(token: token)),
      );
    }
  }

  Future<void> signIn(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      var url = Uri.parse("https://www.smarketp.somee.com/api/Account/login");
      var userData = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      var response = await http.post(
        url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        // Extract the token from the response
        var responseData = jsonDecode(response.body);
        var token = responseData['token'];

        // Store the token securely
        await _storeToken(token);

        // Navigate to the home screen, passing the token
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeWidget(token: token)),
        );
      } else {
        // Handle failure
        print("Login failed with status code: ${response.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed with status code: ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      // Handle network or other errors
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

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
                 Image.asset("assets/Login.png"),
                const Text(
                  "Welcome To Smarket",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff364A5A),
                  ),
                ),
                const Text(
                  "Ship Smarter Today",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff364A5A),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Color(0xff9D9D9D)),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: isSecurePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isSecurePassword = !isSecurePassword;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Color(0xff9D9D9D)),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
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
                          },
                        ),
                        const Text("Remember me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                      /*  Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ForgetPassword()),
                        );*/
                      },
                      child: const Text("Forget password?"),
                    ),
                  ],
                ),
                SignInButton(
                  onPressed: () => _signInAsync(context),
                  isLoading: isLoading,
                ),
                Container(
                  width: 450,
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                   /*   Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signup2()),
                      );*/
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(186, 213, 226, 234),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signInAsync(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      await signIn(context);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
