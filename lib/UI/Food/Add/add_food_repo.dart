import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/Food/Add/add_food_model.dart';

class AddFoodRepository {
  Future<AddFoodModel> addFoodApi(
      String accessToken, String name, var price, File images, var AQ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');
    /*  final Map<String, dynamic> addFood = {
      'name': name,
      'image': image,
      'price': price,
      'availableQuantity': AQ
    };
    final addFoodRes = await http.post(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/add'),
        body: addFood,
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString()
        });*/

    var uri = Uri.parse("https://devhrmapi.mobcoder.com/hrm/api/v1/food/add");
    var request = new http.MultipartRequest(
      "POST",
      uri,
    );
    request.headers["accessToken"] = accesstoken.toString();
    request.headers['Authorization'] = 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==';
    request.fields['name'] = name;
    request.fields['price'] = price;
    request.fields['availableQuantity'] = AQ;
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'img',
      images.path,
    );
    request.files.add(multipartFile);
    var response = await request.send();
    print(response.stream);
    final res = await http.Response.fromStream(response);

    if (res.statusCode == 200) {
      print("addFoodModel" + res.statusCode.toString());

      AddFoodModel addFoodModel = AddFoodModel.fromJson(jsonDecode(res.body));

      print("bodyresponse" + addFoodModel.statusCode.toString());
      return addFoodModel;
    } else {
      return throw Exception("There is some error");
    }
  }
}
