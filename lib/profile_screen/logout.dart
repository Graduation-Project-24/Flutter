import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LogoutService {
  final String apiUrl = 'https://www.smarketp.somee.com/api/Account/Logout';

  Future<bool> logout(String token) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Logout successful
        return true;
      } else {
        // Logout failed
        return false;
      }
    } catch (e) {
      // Error occurred
      print('Error during logout: $e');
      return false;
    }
  }
}

class YourWidget extends StatelessWidget {
  final String token;

  const YourWidget({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // Show loading indicator
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );

        LogoutService logoutService = LogoutService();
        bool isLoggedOut = await logoutService.logout(token);
        // Close loading indicator
        Navigator.pop(context);

        if (isLoggedOut) {
          // Navigate to login2 screen
          Navigator.pushReplacementNamed(context, '/login2');
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logout failed. Please try again.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Text('Logout'),
    );
  }
}