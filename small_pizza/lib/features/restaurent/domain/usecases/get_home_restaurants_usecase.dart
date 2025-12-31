import '../entities/restaurant_entity.dart';
import '../repositories/restaurant_repository.dart';

class GetHomeRestaurantsUseCase {
  final RestaurantRepository repository;

  GetHomeRestaurantsUseCase(this.repository);

  Future<List<RestaurantEntity>> call() {
    return repository.getHomeRestaurants();
  }
}
