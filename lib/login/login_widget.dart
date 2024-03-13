import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
        hintStyle: TextStyle(color: Color(0xff9D9D9D)),
      ),
    );
  }
}

// Password Field Widget
class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool isSecure;

  const PasswordField({Key? key, required this.controller, required this.isSecure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isSecure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            // Toggle password visibility
          },
          icon: const Icon(Icons.remove_red_eye),
        ),
        prefixIcon: const Icon(Icons.lock),
        hintText: "Password",
        hintStyle: const TextStyle(color: Color(0xff9D9D9D)),
      ),
    );
  }
}
// Remember Me Checkbox Widget
class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RememberMeCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.amber,
          value: value,
          onChanged: onChanged,
        ),
        const Text("Remember me"),
      ],
    );
  }
}
// Sign-In Button Widget
class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const SignInButton({Key? key, required this.onPressed, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.only(top: 90, bottom: 10),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 157, 11),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading ? CircularProgressIndicator() : Text(
              "Sign in",
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.logout_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
// Create Account Button Widget
class CreateAccountButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateAccountButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(186, 213, 226, 234),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
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
// Forget Password Button Widget
class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
     /*   Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ForgetPassword()),
        );*/
      },
      child: const Text("Forget password?"),
    );
  }
}