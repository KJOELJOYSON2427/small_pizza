import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';

import '../entities/restaurant_entity.dart';
import '../entities/restaurant_details_entity.dart';
import '../enums/restaurant_category.dart';

abstract class RestaurantRepository {
  /// Home page – mixed content

  Future<List<RestaurantEntity>> getHomeRestaurants();


  /// Popular section
  Future<List<RestaurantEntity>> getPopularRestaurants();

  /// Recently viewed / ordered
  Future<List<RestaurantEntity>> getRecentRestaurants();

  /// Filter by cuisine/category (Italian, Sri Lankan, Indian)
  Future<List<RestaurantEntity>> getRestaurantsByCuisine(
    Cuisine cuisine,
  );

  /// Full details page
  Future<RestaurantDetailsEntity> getRestaurantDetails(String restaurantId);
}
