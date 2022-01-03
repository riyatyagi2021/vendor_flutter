import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vendor_flutter/UI/Auth/forgot/ForgotModel.dart';



class ForgotRepository {

  Future<ForgotModel> loginApi(String email) async {
    final Map<String, dynamic> forgot = {
      'email': email,
    };
    //print("Login data" + login.toString());
    final forgotRes = await http.post(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/forgotPassword'),
        body: forgot,
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
        }
    );

    if (forgotRes.statusCode == 200) {
      print("loginmodel" + forgotRes.statusCode.toString());

      ForgotModel forgotModel = ForgotModel.fromJson(jsonDecode(forgotRes.body));

      print("bodyresponse" + forgotModel.statusCode.toString());
      return forgotModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}