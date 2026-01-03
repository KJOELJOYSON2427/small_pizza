import 'package:small_pizza/features/restaurent/data/models/restaurant_details_model.dart';

import '../models/restaurant_model.dart';

abstract class RestaurantDataSource {
  Future<List<RestaurantModel>> getAllRestaurants();

  Future<RestaurantDetailsModel> getRestaurantDetails(String id);
}
