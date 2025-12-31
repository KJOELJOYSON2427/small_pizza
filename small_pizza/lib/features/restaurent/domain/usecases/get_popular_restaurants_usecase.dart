import '../entities/restaurant_entity.dart';
import '../repositories/restaurant_repository.dart';

class GetPopularRestaurantsUseCase {
  final RestaurantRepository repository;

  GetPopularRestaurantsUseCase(this.repository);

  Future<List<RestaurantEntity>> call() {
    return repository.getPopularRestaurants();
  }
}
