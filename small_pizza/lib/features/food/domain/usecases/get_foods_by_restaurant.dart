import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

import '../repositories/food_repository.dart';

class GetFoodsByRestaurantUseCase {
  final FoodRepository repository;

  GetFoodsByRestaurantUseCase(this.repository);

  Future<List<FoodEntity>> call(String restaurantId) {
    print(restaurantId);
    return repository.getFoodsByRestaurant(restaurantId);
  }
}
