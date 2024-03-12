import 'package:flutter/material.dart';

class LoginControllers extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool remember;
  final bool isSecurePassword;
  final bool isLoading;
  final void Function(BuildContext) onSignIn;

  const LoginControllers({
    required this.emailController,
    required this.passwordController,
    required this.remember,
    required this.isSecurePassword,
    required this.isLoading,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Your controller widgets here
      ),
    );
  }
}
