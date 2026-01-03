abstract class PopularFromRestaurantEvent {}

class LoadPopularFromRestaurant extends PopularFromRestaurantEvent {
  final String restaurantId;

  LoadPopularFromRestaurant(this.restaurantId);
}
