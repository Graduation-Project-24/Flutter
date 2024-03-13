// ChangePasswordController.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:linked_all_pages/chanage%20password/chanage%20Model%20Class.dart';
import 'package:linked_all_pages/screens/login.dart';

class ChangePasswordController {
  Future<void> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
    required BuildContext context,
  }) async {
    final String apiUrl =
        "https://www.smarketp.somee.com/api/Account/ChangePassword";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(ChangePasswordModel(
          email: email,
          currentPassword: currentPassword,
          newPassword: newPassword,
        ).toJson()),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        _handleSuccess(context);
      } else {
        _handleFailure(response);
      }
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleSuccess(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return login();
    }));
  }

  void _handleFailure(http.Response response) {
    print("Password change failed. Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
    // Handle the failure scenario here
  }

  void _handleError(dynamic error) {
    print("Error during password change: $error");
    // Handle any network or unexpected errors
  }
}
