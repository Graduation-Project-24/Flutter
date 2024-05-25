import 'package:flutter/material.dart';

Widget ProductCard(String imageUrl, String name, String price) {
  return Container(
    width: 151,
    decoration: ShapeDecoration(
      color: const Color(0xFFD5E2EA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          imageUrl,
          height: 100, // Set a fixed height or adjust as needed
          width: 151,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(
              color: Color(0xFF393F42),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2, // Limit the name to 2 lines
            overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "$price EGP",
            style: const TextStyle(
              color: Color(0xFF393F42),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: MaterialButton(
              onPressed: () {
                // Add your logic here
              },
              textColor: Colors.white,
              color: const Color(0xFFFAA933),
              child: const Text('Add to cart'),
            ),
          ),
        )
      ],
    ),
  );
}
