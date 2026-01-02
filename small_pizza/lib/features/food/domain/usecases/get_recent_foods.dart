import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

import '../repositories/food_repository.dart';

class GetRecentFoodsUseCase {
  final FoodRepository repository;

  GetRecentFoodsUseCase(this.repository);

  Future<List<FoodEntity>> call() {
    return repository.getRecentFoods();
  }
}
