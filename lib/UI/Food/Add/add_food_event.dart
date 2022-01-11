import 'dart:io';

abstract class AddFoodEvent {}

class OnAddFoodEvent extends AddFoodEvent {
  String foodName;
  String price;
  String AQ;
  File image;
  OnAddFoodEvent(this.foodName, this.price, this.AQ, this.image);
}
