import 'package:flutter/material.dart';

class empty extends StatefulWidget {
  const empty({super.key});

  @override
  State<empty> createState() => _emptyState();
}

class _emptyState extends State<empty> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'NEXT SPRINT',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
      )),
    );
  }
}
