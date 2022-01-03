
import 'home_model.dart';

abstract class HomeEvent {}

class OnHomeApiHit extends HomeEvent {
  FoodListModel foodListModel;
  OnHomeApiHit(this.foodListModel);
}

class OnDrawerClick extends HomeEvent{
  OnDrawerClick();
}