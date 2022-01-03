
class ForgotModel {
  int? statusCode;
  ResponseData? responseData;

  ForgotModel(
      {this.statusCode, this.responseData});

  ForgotModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    responseData = json['responseData'] != null
        ? new ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.responseData != null) {
      data['responseData'] = this.responseData?.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? message;

  ResponseData({this.message});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

