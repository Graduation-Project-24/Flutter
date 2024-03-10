import 'package:flutter/material.dart';

Widget TextFieldWidget({
  required String hintTitle,
  required TextInputType type,
  required TextEditingController controller,
  required Icon icon,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    decoration: InputDecoration(
      enabled: true,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(90, 157, 157, 157))),
      prefixIcon: icon,
      prefixIconColor: const Color(0xff9D9D9D),
      hintText: hintTitle,
      // hintStyle: TextStyle(color: Color(0xff9D9D9D)),
    ),
    validator: (input) {
      if (controller.text.isNotEmpty) {
        return null;
      } else {
        return "$hintTitle must not be empty!";
      }
    },
  );
}
