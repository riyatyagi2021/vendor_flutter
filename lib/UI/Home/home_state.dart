

import 'package:vendor_flutter/UI/Auth/login_model.dart';
import 'package:vendor_flutter/Utils/preference_utils.dart';

import 'home_model.dart';
import 'home_repository.dart';

class HomeState{
  final bool isSuccess;
  final bool isError;
  final FoodListRepository repository;
  final PreferenceUtils prefUtils;
  final LoginModel loginModel;
  final  FoodListModel model;


  HomeState._(this.isSuccess,this.isError,this.repository,this.model,this.prefUtils,this.loginModel);

  HomeState.onHomeSuccess( bool isSuccess,bool isError,FoodListRepository repository,FoodListModel model,PreferenceUtils preferenceUtils,LoginModel loginModel)
      : this._(isSuccess,false,repository,model,preferenceUtils,loginModel);

  HomeState.onHomeFailure( bool isSuccess,bool isError,FoodListRepository repository,FoodListModel model,PreferenceUtils preferenceUtils,LoginModel loginModel)
      : this._(false,isError,repository,model,preferenceUtils,loginModel);

  HomeState.onInit() : this._(false, false, FoodListRepository(),FoodListModel(),PreferenceUtils(),LoginModel());

}