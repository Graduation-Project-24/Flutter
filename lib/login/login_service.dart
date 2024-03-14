import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_model.dart';

class LoginService {
  static Future<String?> signIn(LoginModel userData) async {
    try {
      var url = Uri.parse("https://www.smarketp.somee.com/api/Account/login");
      var response = await http.post(
        url,
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(userData.toJson()),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        return responseData['token'];
      } else {
        print("Login failed with status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  static Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
