import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';

import '../entities/restaurant_entity.dart';
import '../repositories/restaurant_repository.dart';

class GetRestaurantsByCuisineUseCase {
  final RestaurantRepository repository;

  GetRestaurantsByCuisineUseCase(this.repository);

  Future<List<RestaurantEntity>> call(Cuisine cuisine) {
    return repository.getRestaurantsByCuisine(cuisine);
  }
}
