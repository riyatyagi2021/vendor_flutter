import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vendor_flutter/UI/Auth/logout/logout_model.dart';

class LogoutRepository {
  Future<LogoutModel> logoutApi(String accessToken) async {
    final Map<String, dynamic> logout = {'accessToken': accessToken};
    final logoutRes = await http.post(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/logout'),
        body: logout,
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
        });

    if (logoutRes.statusCode == 200) {
      print("loginmodel" + logoutRes.statusCode.toString());
      LogoutModel logoutModel = LogoutModel.fromJson(jsonDecode(logoutRes.body));
      print("bodyresponse" + logoutModel.statusCode.toString());
      return logoutModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
