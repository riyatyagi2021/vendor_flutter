import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete_event.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete_model.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete_repo.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteState.onInit());
  DeleteRepository deleteRepo = DeleteRepository();

  @override
  Stream<DeleteState> mapEventToState(DeleteEvent event) async* {
    if (event is DeleteFoodEvent) {
      var isSuccess = await onDeleteApi(state, event.foodId);
      if (isSuccess.statusCode == 1) {
        yield DeleteState.onSuccess(state, true, false, isSuccess);
      } else {
        yield DeleteState.onFailure(state, false, false, isSuccess);
      }
    }
  }

  Future<DeleteFoodModel> onDeleteApi(DeleteState state, String foodId) async {
    DeleteFoodModel respp = await deleteRepo.deleteApi("", "");

    if (respp.statusCode == 1) {
      print("cvbnjhgfdxsxdcvb" + respp.statusCode.toString());
      return respp;
    } else {
      return respp;
    }
  }
}
