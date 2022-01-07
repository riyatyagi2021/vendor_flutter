import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/Auth/login_model.dart';

class PreferenceUtils {
  static void setAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', accessToken);
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static void setUserProfile(EmployeeProfile employeeProfile) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('employee_data', jsonEncode(employeeProfile));
  }

  static Future<EmployeeProfile> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    EmployeeProfile userData = EmployeeProfile();

    var data = prefs.getString('employee_data');

    if (data != null) {
      EmployeeProfile userData1 = EmployeeProfile.fromJson(jsonDecode(data));
      print(
          userData1.firstName.toString() + "nameeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      if (userData1 == null) {
        return userData;
      } else {
        return userData1;
      }
    }
    return userData;
  }
}
