abstract class DeleteEvent {}

class DeleteFoodEvent extends DeleteEvent {
  late String foodId;
  DeleteFoodEvent(this.foodId);
}
