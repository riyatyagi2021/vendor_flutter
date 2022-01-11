class TransactionModel {
  int? statusCode;
  ResponseData? responseData;
  RequestParams? requestParams;
  String? time;

  TransactionModel(
      {this.statusCode, this.responseData, this.requestParams, this.time});

  TransactionModel.fromJson(Map<String, dynamic> json) {
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
  List<TransactionList>? transactionList;
  int? isAdmin;

  ResponseData({this.message, this.transactionList, this.isAdmin});

  ResponseData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['transactionList'] != null) {
      transactionList = <TransactionList>[];
      json['transactionList'].forEach((v) {
        transactionList?.add(new TransactionList.fromJson(v));
      });
    }
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.transactionList != null) {
      data['transactionList'] =
          this.transactionList?.map((v) => v.toJson()).toList();
    }
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class TransactionList {
  String? transactionId;
  String? userId;
  UserName? userName;
  String? userPhone;
  String? orderId;
  int? couponWalletAmount;
  int? walletAmount;
  int? amountType;
  int? transactionType;
  int? status;
  String? created;

  TransactionList(
      {this.transactionId,
      this.userId,
      this.userName,
      this.userPhone,
      this.orderId,
      this.couponWalletAmount,
      this.walletAmount,
      this.amountType,
      this.transactionType,
      this.status,
      this.created});

  TransactionList.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    userId = json['userId'];
    userName = json['userName'] != null
        ? new UserName.fromJson(json['userName'])
        : null;
    userPhone = json['userPhone'];
    orderId = json['orderId'];
    couponWalletAmount = json['couponWalletAmount'];
    walletAmount = json['walletAmount'];
    amountType = json['amountType'];
    transactionType = json['transactionType'];
    status = json['status'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['userId'] = this.userId;
    if (this.userName != null) {
      data['userName'] = this.userName?.toJson();
    }
    data['userPhone'] = this.userPhone;
    data['orderId'] = this.orderId;
    data['couponWalletAmount'] = this.couponWalletAmount;
    data['walletAmount'] = this.walletAmount;
    data['amountType'] = this.amountType;
    data['transactionType'] = this.transactionType;
    data['status'] = this.status;
    data['created'] = this.created;
    return data;
  }
}

class UserName {
  String? firstName;
  String? middleName;
  String? lastName;

  UserName({this.firstName, this.middleName, this.lastName});

  UserName.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['middleName'] = this.middleName;
    data['lastName'] = this.lastName;
    return data;
  }
}

class RequestParams {
  RequestParams();

  RequestParams.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
