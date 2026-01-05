abstract class MenuEvent {}

class LoadMenuCategories extends MenuEvent {
  final String restaurantId;

  LoadMenuCategories(this.restaurantId);
}
