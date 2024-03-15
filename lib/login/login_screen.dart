import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/home_screen.dart';
import 'package:linked_all_pages/signup/sign2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_model.dart';
import 'login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  late bool isSecurePassword = true;
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLoggedIn();
  }

  Future<void> _checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(token: token)),
      );
    }
  }

  Future<void> signIn(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      var userData = LoginModel(
        email: emailController.text,
        password: passwordController.text,
      );
      String? token = await LoginService.signIn(userData);

      if (token != null) {
        await LoginService.storeToken(token);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(token: token)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed. Please try again.'),
          ),
        );
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLoginForm(),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              _buildTitle(),
              _buildEmailField(),
              _buildPasswordField(),
              _buildRememberMe(),
              SignInButton(
                onPressed: () => _signInAsync(context),
                isLoading: isLoading,
              ),
              _buildCreateAccountButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset("assets/Login.png");
  }

  Widget _buildTitle() {
    return const Column(
      children: [
        Text(
          "Welcome To Smarket",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Color(0xff364A5A),
          ),
        ),
        Text(
          "Ship Smarter Today",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff364A5A),
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
        hintStyle: TextStyle(color: Color(0xff9D9D9D)),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
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
    );
  }

  Widget _buildRememberMe() {
    return Row(
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
            // Navigate to forgot password screen
          },
          child: const Text("Forget password?"),
        ),
      ],
    );
  }

  Widget _buildCreateAccountButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Sign_up()),
      );
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

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const SignInButton({
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 157, 11),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const CircularProgressIndicator()
                : const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.black),
                  ),
            const Icon(
              Icons.logout_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
