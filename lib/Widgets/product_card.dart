import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/charttt.dart';

Widget ProductCard(String image, String name, String price) {
  return Container(
    width: 151,
    decoration: ShapeDecoration(
      color: const Color(0xFFD5E2EA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    child: Column(
      children: [
        Image.asset(image),
        Text(
          name,
          style: const TextStyle(
              color: Color(0xFF393F42),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        Text(
          "$price EGP",
          style: const TextStyle(
              color: Color(0xFF393F42),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        MaterialButton(
          onPressed: () {
            //  Navigator
            //       .pushReplacement(MaterialPageRoute(builder: (context) {
            //     return  chart();
            //   }));
          },
          textColor: Colors.white,
          color: const Color(0xFFFAA933),
          child: const Text('Add to cart'),
        )
      ],
    ),
  );
}
