import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

import '../repositories/food_repository.dart';

class GetRecentFoods {
  final FoodRepository repository;

  GetRecentFoods(this.repository);

  Future<List<FoodEntity>> call() {
    return repository.getRecentFoods();
  }
}
