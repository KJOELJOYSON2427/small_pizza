import '../entities/restaurant_entity.dart';
import '../repositories/restaurant_repository.dart';

class GetRecentRestaurantsUseCase {
  final RestaurantRepository repository;

  GetRecentRestaurantsUseCase(this.repository);

  Future<List<RestaurantEntity>> call() {
    return repository.getRecentRestaurants();
  }
}
