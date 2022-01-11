import 'dart:io';

abstract class EditFoodEvent {}

class OnEditFoodEvent extends EditFoodEvent {
  String foodName;
  String price;
  String AQ;
  File image;
  OnEditFoodEvent(this.foodName, this.price, this.AQ, this.image);
}
