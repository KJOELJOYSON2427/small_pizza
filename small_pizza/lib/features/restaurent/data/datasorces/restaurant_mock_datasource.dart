import '../models/restaurant_model.dart';

abstract class RestaurantDataSource {
  Future<List<RestaurantModel>> getAllRestaurants();
}