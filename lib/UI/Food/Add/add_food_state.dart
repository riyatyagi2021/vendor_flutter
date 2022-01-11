import 'package:vendor_flutter/UI/Food/Add/add_food_model.dart';

class AddFoodState {
  final bool isSuccess;
  final bool isError;
  final AddFoodModel model;

  AddFoodState._(this.isSuccess, this.isError, this.model);

  AddFoodState.onSuccess(
      AddFoodState state, bool isSuccess, bool isError, AddFoodModel model)
      : this._(isSuccess, false, model);

  AddFoodState.onFailure(
      AddFoodState state, bool isSuccess, bool isError, AddFoodModel model)
      : this._(false, isError, model);

  AddFoodState.onLoadData(
      AddFoodState state, bool isSuccess, bool isError, AddFoodModel model)
      : this._(false, isError, model);

  AddFoodState.onInit() : this._(false, false, AddFoodModel());
}
