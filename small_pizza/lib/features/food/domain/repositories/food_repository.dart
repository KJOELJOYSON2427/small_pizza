
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

abstract class FoodRepository {
  /// Home → Recent Items
  Future<List<FoodEntity>> getRecentFoods();

  /// Home → Most Popular
  Future<List<FoodEntity>> getPopularFoods();

  /// Restaurant Detail Page
  Future<List<FoodEntity>> getFoodsByRestaurant(
    String restaurantId,
  );
}
