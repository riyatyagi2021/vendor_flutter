import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete_model.dart';

class DeleteRepository {
  Future<DeleteFoodModel> deleteApi(String accessToken, String foodId) async {
    final Map<String, dynamic> delete = {'foodId': foodId};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = prefs.getString('access_token');
    final deleteRes = await http.delete(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/delete'),
        body: delete,
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accessToken.toString(),
        });

    if (deleteRes.statusCode == 200) {
      print("loginmodel" + deleteRes.statusCode.toString());

      DeleteFoodModel deleteModel =
          DeleteFoodModel.fromJson(jsonDecode(deleteRes.body));

      print("bodyresponse" + deleteModel.statusCode.toString());
      return deleteModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
