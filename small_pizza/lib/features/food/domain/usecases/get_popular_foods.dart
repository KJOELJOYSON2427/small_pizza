import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

import '../repositories/food_repository.dart';

class GetPopularFoods {
  final FoodRepository repository;

  GetPopularFoods(this.repository);

  Future<List<FoodEntity>> call() {
    return repository.getPopularFoods();
  }
}
