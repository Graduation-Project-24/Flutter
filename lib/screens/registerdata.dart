import 'dart:convert';
import 'package:http/http.dart';

class RegisterData {
  void register(
      {required String email,
      required String firstName,
      required String lastName,
      required String phone,
      required String password,
      required String dateOfBirth}) async {
    Response response = await post(
        Uri.parse('https://www.smarketp.somee.com/api/Account/register'));

    List<dynamic> data = jsonDecode(response.body);
  }
}
