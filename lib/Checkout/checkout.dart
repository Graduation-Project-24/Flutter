import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/Cart/cart_screen.dart';
import 'package:linked_all_pages/url.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CheckoutPage extends StatefulWidget {
  final String token;

  CheckoutPage({required this.token});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _sessionUrl;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchSessionUrl();
  }

  Future<void> _fetchSessionUrl() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String url = URL();
      // Make a POST request to fetch the session URL
      final response = await http.post(
        Uri.parse('$url/Order/Checkout'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.token}',
        },
      );

      if (response.statusCode == 200) {
        // Extract the session URL from the response
        final responseData = jsonDecode(response.body);
        final sessionUrl = responseData['sessionUrl'];

        setState(() {
          _sessionUrl = sessionUrl;
        });
      } else {
        // Handle errors
        throw 'Error: ${response.reasonPhrase}';
      }
    } catch (e) {
      print('Error fetching session URL: $e');
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _launchStripeCheckout() async {
    if (_sessionUrl != null) {
      try {
        // Launch the Stripe checkout page in the device's default web browser
        await launchUrlString(_sessionUrl as String);
      } catch (e) {
        print('Error launching checkout: $e');
        // Handle error
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartScreen(
                        token: widget.token as String,
                      )),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: const Color(0xff384959),
        ),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _sessionUrl != null
                ? ElevatedButton(
                    onPressed: _launchStripeCheckout,
                    child: Text('Proceed to Checkout'),
                  )
                : Text('Error fetching session URL'),
      ),
    );
  }
}
