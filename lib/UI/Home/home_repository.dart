import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'home_model.dart';



class FoodListRepository {

  Future productsApi(String accesstoken) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');
    print(accesstoken.toString() + "bn");
    final productListRes = await http.get(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/food/list'),
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString()
        });
    if (productListRes.statusCode == 200) {
      print(" product list api hit? " + productListRes.body);
      FoodListModel foodListModel =
      FoodListModel.fromJson(jsonDecode(productListRes.body));
      print("ProductList Body Response " + foodListModel.toString());
      return foodListModel;
    } else
      throw Exception("There is some error");
  }
}
