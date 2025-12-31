import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

import '../repositories/food_repository.dart';

class GetFoodsByRestaurant {
  final FoodRepository repository;

  GetFoodsByRestaurant(this.repository);


  Future<List<FoodEntity>> call(String restaurantId) {
    return repository.getFoodsByRestaurant(restaurantId);
  }
}
