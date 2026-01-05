
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';

abstract class FoodRepository {
  /// Home → Recent Items
  Future<List<FoodEntity>> getRecentFoods();

  /// Home → Most Popular
  Future<List<FoodEntity>> getPopularFoods();

  /// Restaurant Detail Page
  Future<List<FoodEntity>> getFoodsByRestaurant(
    String restaurantId,
  );

  Future<List<(MealCategory, int)>> getAvailableMealCategoriesAndCategoryCount(
    String restaurantId,
  );

  Future<List<FoodEntity>> getFoodsByRestaurantAndCategory({
    required String restaurantId,
    required MealCategory category,
  });
}
