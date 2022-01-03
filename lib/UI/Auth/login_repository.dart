import 'dart:convert';

import 'package:http/http.dart' as http;

import 'login_model.dart';

class LoginRepository {

  Future<LoginModel> loginApi(String email, String password) async {
    final Map<String, dynamic> login = {
      'email': email,
      'password': password
    };
    //print("Login data" + login.toString());
    final loginRes = await http.post(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/login'),
        body: login,
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
        }
        );

    if (loginRes.statusCode == 200) {
      print("loginmodel" + loginRes.statusCode.toString());

      LoginModel loginModel = LoginModel.fromJson(jsonDecode(loginRes.body));

      print("bodyresponse" + loginModel.statusCode.toString());
      // print('bodyresponse  ${loginModel.error.msg}');
      return loginModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}