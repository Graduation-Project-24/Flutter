import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product_details_screen.dart';

class AddReviewPage extends StatefulWidget {
  final int productId;
  final String token;

  const AddReviewPage({Key? key, required this.productId, required this.token})
      : super(key: key);

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  final _formKey = GlobalKey<FormState>();
  int? _rate = 1;
  final _commentController = TextEditingController();

  Future<void> _submitReview() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('https://www.smarketp.somee.com/api/Review/Add'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.token}',
        },
        body: json.encode({
          'rate': _rate,
          'comment': _commentController.text,
          'productId': widget.productId,
          'userId': 0,
        }),
      );

      if (response.statusCode == 200) {
        // Handle success
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsWidget(
              productId: widget.productId,
              token: widget.token,
            ),
          ),
        );
      } else {
        // Handle error
        print('Failed to add review: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<int>(
                value: _rate,
                onChanged: (value) {
                  setState(() {
                    _rate = value!;
                  });
                },
                items: List.generate(5, (index) => index + 1)
                    .map((rate) => DropdownMenuItem(
                          value: rate,
                          child: Text(rate.toString()),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value == 0) {
                    return 'Please select a rating';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Comment',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a comment';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitReview,
                child: Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
