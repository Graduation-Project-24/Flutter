import 'dart:js';
import 'package:flutter/material.dart';


class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool remember;
  final bool isSecurePassword;
  final bool isLoading;
  final void Function(BuildContext) onSignIn;

  const LoginForm({
    required this.emailController,
    required this.passwordController,
    required this.remember,
    required this.isSecurePassword,
    required this.isLoading,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widgets extracted into individual methods for better readability
              _buildTitle(),
              _buildEmailField(),
              _buildPasswordField(),
              _buildRememberMe(),
              _buildSignInButton(context),
              _buildCreateAccountButton(context),
            ],
          ),
        ),
      ),
    );
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
                // Update the state of 'remember'
              },
            ),
            const Text("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () {
          /*  Navigator.pushReplacement(
                        context as BuildContext,
                        MaterialPageRoute(builder: (context) => ForgetPassword()),
                      );*/
          },
          child: const Text("Forget password?"),
        ),
      ],
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.only(top: 90, bottom: 10),
      child: ElevatedButton(
        onPressed: isLoading ? null : () async {
          onSignIn(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 157, 11),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading ? const CircularProgressIndicator() : const Text(
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

  Widget _buildCreateAccountButton(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
        /* Navigator.pushReplacement(
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
    );
  }
}
