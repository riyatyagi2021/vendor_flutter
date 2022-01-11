class AddFoodModel {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  AddFoodModel(
      {this.statusCode, this.responseData, this.requestParams, this.time});

  AddFoodModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
    requestParams = json['requestParams'] != null
        ? new RequestParams.fromJson(json['requestParams'])
        : null;
    time = json['time'];
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
    data['time'] = this.time;
    return data;
  }
}

class ResponseData {
  String? message;
  FoodItem? foodItem;
  int? isAdmin;

  ResponseData({this.message, this.foodItem, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    foodItem = json['foodItem'] != null
        ? new FoodItem.fromJson(json['foodItem'])
        : null;
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.foodItem != null) {
      data['foodItem'] = this.foodItem?.toJson();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class FoodItem {
  String? foodId;
  String? name;
  int? price;
  int? status;
  String? description;
  int? isAvailable;
  int? availableQuantity;
  String? image;
  int? isDeleted;

  FoodItem(
      {this.foodId,
      this.name,
      this.price,
      this.status,
      this.description,
      this.isAvailable,
      this.availableQuantity,
      this.image,
      this.isDeleted});

  FoodItem.fromJson(Map<String, dynamic> json) {
    foodId = json['foodId'];
    name = json['name'];
    price = json['price'];
    status = json['status'];
    description = json['description'];
    isAvailable = json['isAvailable'];
    availableQuantity = json['availableQuantity'];
    image = json['image'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['foodId'] = this.foodId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['status'] = this.status;
    data['description'] = this.description;
    data['isAvailable'] = this.isAvailable;
    data['availableQuantity'] = this.availableQuantity;
    data['image'] = this.image;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

class RequestParams {
  String? name;
  String? price;
  String? location;

  RequestParams({this.name, this.price, this.location});

  RequestParams.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['location'] = this.location;
    return data;
  }
}
