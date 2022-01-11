import 'edit_model.dart';

class EditFoodState {
  final bool isSuccess;
  final bool isError;
  final EditFoodModel model;

  EditFoodState._(this.isSuccess, this.isError, this.model);

  EditFoodState.onSuccess(
      EditFoodState state, bool isSuccess, bool isError, EditFoodModel model)
      : this._(isSuccess, false, model);

  EditFoodState.onFailure(
      EditFoodState state, bool isSuccess, bool isError, EditFoodModel model)
      : this._(false, isError, model);

  EditFoodState.onLoadData(
      EditFoodState state, bool isSuccess, bool isError, EditFoodModel model)
      : this._(false, isError, model);

  EditFoodState.onInit() : this._(false, false, EditFoodModel());
}
