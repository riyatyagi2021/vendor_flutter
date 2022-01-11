import 'package:vendor_flutter/UI/Food/Delete/delete_model.dart';

class DeleteState {
  final bool isSuccess;
  final bool isError;
  final DeleteFoodModel model;

  DeleteState._(this.isSuccess, this.isError, this.model);

  DeleteState.onSuccess(
      DeleteState state, bool isSuccess, bool isError, DeleteFoodModel model)
      : this._(isSuccess, false, model);

  DeleteState.onFailure(
      DeleteState state, bool isSuccess, bool isError, DeleteFoodModel model)
      : this._(false, isError, model);

  DeleteState.onInit() : this._(false, false, DeleteFoodModel());
}
