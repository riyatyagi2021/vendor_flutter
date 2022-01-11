import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/Auth/logout/logout_model.dart';

class LogoutRepository {
  Future<LogoutModel> logoutApi(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');
    // final Map<String, dynamic> logout = {'accessToken': accessToken};

    final logoutRes = await http.post(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/employee/logout'),
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString()
        });

    if (logoutRes.statusCode == 200) {
      print("logoutmodel" + logoutRes.statusCode.toString());
      LogoutModel logoutModel =
          LogoutModel.fromJson(jsonDecode(logoutRes.body));
      print("bodyresponse" + logoutModel.statusCode.toString());
      return logoutModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
