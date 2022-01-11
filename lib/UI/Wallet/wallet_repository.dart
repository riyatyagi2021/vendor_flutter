import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_flutter/UI/Wallet/wallet_model.dart';

class WalletListRepository {
  Future walletApi(String accesstoken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accesstoken = prefs.getString('access_token');

    print(accesstoken.toString() + "   bn");
    final walletListRes = await http.get(
        Uri.parse('https://devhrmapi.mobcoder.com/hrm/api/v1/transaction/list'),
        headers: {
          'Authorization': 'Basic aHJtX2FkbWluOmFkbWluQGhybQ==',
          'accessToken': accesstoken.toString()
        });

    if (walletListRes.statusCode == 200) {
      print(" product list api hit? " + walletListRes.body);
      TransactionModel walletListModel =
          TransactionModel.fromJson(jsonDecode(walletListRes.body));
      print("sxcfvgbnjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
      print("ProductList Body Response " + walletListModel.toString());
      return walletListModel;
    } else
      throw Exception("There is some error");
  }
}
