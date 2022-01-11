class DeleteFoodModel {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;

  DeleteFoodModel({this.statusCode, this.responseData, this.requestParams});

  DeleteFoodModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
    requestParams = json['requestParams'] != null
        ? new RequestParams.fromJson(json['requestParams'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData?.toJson();
    }
    if (this.requestParams != null) {
      data['requestParams'] = this.requestParams?.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? message;
  Null foodItem;
  int? isAdmin;

  ResponseData({this.message, this.foodItem, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    foodItem = json['foodItem'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['foodItem'] = this.foodItem;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class RequestParams {
  String? foodId;

  RequestParams({this.foodId});

  RequestParams.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    return data;
  }
}
