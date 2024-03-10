import 'dart:convert';
import 'package:bloc/bloc.dart';
// import 'package:code_app/shared/constants/constants.dart';
// import 'package:code_app/shared/network/local_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  // Todo: API URL => https://student.valuxapps.com/api/
  // Todo: Register endpoint => register
  void register(
      {required String email,
      required String firstName,
      required String lastName,
      required String phone,
      required String password,
      required String dateOfBirth}) async {
    // emit(RegisterLoadingState());
    try {
      Response response = await http.post(
          // request Url = base url + method url ( endpoint ) = https://student.valuxapps.com + /api/register
          Uri.parse('https://www.smarketp.somee.com/api/Account/register'),
          headers: {"content-type": "application/json"},
          body: jsonEncode(
            {
              'firstName': firstName,
              'lastName': lastName,
              'dateOfBirth': dateOfBirth,
              'phone': phone,
              'email': email,
              'password': password,
            },
          ));

      print(response.statusCode);
      if (response.statusCode == 200) {
        print('success');
        var data = jsonDecode(response.body);
        debugPrint("Response is : $data");
        print(data['username']);
        emit(RegisterSuccessState());
        // if (data['status'] == true) {
        //   debugPrint("Response is : $data");
        //   emit(RegisterSuccessState());
        // } else {
        //   debugPrint("Response is : $data");
        //   emit(FailedToRegisterState(message: data['message']));
        // }
      } else {
        print('failed');
      }
    } catch (e) {
      debugPrint("Failed to Register , reason : $e");
      emit(FailedToRegisterState(message: e.toString()));
    }
  }

  // Account : mo.ha@gmail.com , password : 123456
  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await http.post(
          // request => url = base url + method url
          Uri.parse('https://www.smarketp.somee.com/api/Account/login'),
          body: jsonEncode(
            {'email': email, 'password': password},
          ));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // if (responseData['status'] == true) {
        debugPrint(
            "User login success and his Data is : ${responseData['data']['token']}");
        // await CacheNetwork.insertToCache(key: "token", value: responseData['data']['token']);
        // await CacheNetwork.insertToCache(key: "password", value: password);
        // userToken = await CacheNetwork.getCacheData(key: "token");
        // currentPassword = await CacheNetwork.getCacheData(key: "password");
        emit(LoginSuccessState());
      } else {
        print('failed');
        // debugPrint("Failed to login, reason is : ${responseData['message']}");
        // emit(FailedToLoginState(message: responseData['message']));
      }
    } catch (e) {
      debugPrint("Failed to login , reason : $e");
      emit(FailedToLoginState(message: e.toString()));
    }
  }

  String? chosenValue;
  void changeDropDownValue({required String val}) {
    chosenValue = val;
    emit(ChangeValueSuccessState());
  }
}
