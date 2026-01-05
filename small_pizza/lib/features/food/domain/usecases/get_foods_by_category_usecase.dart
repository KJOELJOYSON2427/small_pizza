import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

import '../enums/menu_category.dart';
import '../repositories/food_repository.dart';

class GetFoodsByRestaurantAndCategoryUseCase {
  final FoodRepository repository;

  GetFoodsByRestaurantAndCategoryUseCase(this.repository);

  Future<List<FoodEntity>> call({
    required String restaurantId,
    required MealCategory category,
  }) async {
    return repository.getFoodsByRestaurantAndCategory(
      restaurantId: restaurantId,
      category: category,
    );
  }
}
