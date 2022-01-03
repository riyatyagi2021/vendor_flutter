import 'package:vendor_flutter/BaseBloc/base_bloc.dart';
import 'package:vendor_flutter/UI/Auth/login_model.dart';
import 'package:vendor_flutter/Utils/preference_utils.dart';
import 'package:flutter/material.dart';
import 'home_event.dart';
import 'home_model.dart';
import 'home_repository.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeState.onInit());

  // Future getApiData() async {
  //   PreferenceUtils.getAccessToken().then((token) {
  //     ACCESS_TOKEN=token.toString();
  //     print(ACCESS_TOKEN+" access tokennnn");
  //   });
  // }
  // String ACCESS_TOKEN="";

  PreferenceUtils preferenceUtils=PreferenceUtils();
  LoginModel  loginModel=LoginModel();

  FoodListRepository foodListRepository =FoodListRepository();

  @override
  void init() {
    super.init();
    onHomeApi();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnHomeApiHit) {
      if (event.foodListModel.statusCode == 1) {
     //   print("${loginModel.res?.user?.name.toString()} value");
        yield HomeState.onHomeSuccess( true, false, foodListRepository,event.foodListModel,preferenceUtils,loginModel);
      } else {
        yield HomeState.onHomeFailure(false, true, foodListRepository, event.foodListModel,preferenceUtils,loginModel);
      }
    }

  }

  void onHomeApi() async {

    try {
    Future.delayed(Duration(seconds: 2));
      FoodListModel foodListModel = await foodListRepository.productsApi("");
      print("ProductList Resp value" + foodListModel.toString());
      add(OnHomeApiHit(foodListModel));

    } catch(e) {
      print("There is something wrong");
    }
  }




}
