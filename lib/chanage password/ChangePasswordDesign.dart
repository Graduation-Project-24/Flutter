// ChangePasswordDesign.dart
import 'package:flutter/material.dart';
import 'ChangePasswordController.dart';

class ChangePasswordDesign extends StatefulWidget {
  @override
  _ChangePasswordDesignState createState() => _ChangePasswordDesignState();
}

class _ChangePasswordDesignState extends State<ChangePasswordDesign> {
  TextEditingController emailController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  final ChangePasswordController _controller = ChangePasswordController();

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
              _buildTextField("Email", Icons.email, emailController),
              _buildTextField("Current Password", Icons.lock_outline, currentPasswordController),
              _buildTextField("New Password", Icons.lock_outline, newPasswordController),
              const SizedBox(
                height: 80,
              ),
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 40,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(90, 157, 157, 157)),
          ),
          prefixIcon: Icon(icon),
          prefixIconColor: Color(0xff9D9D9D),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff9D9D9D),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: 450,
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: ElevatedButton(
        onPressed: () {
          _controller.changePassword(
            email: emailController.text,
            currentPassword: currentPasswordController.text,
            newPassword: newPasswordController.text,
            context: context,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffFAA933),
        ),
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
    );
  }
}
