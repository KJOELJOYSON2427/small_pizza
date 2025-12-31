import '../entities/restaurant_details_entity.dart';
import '../repositories/restaurant_repository.dart';

class GetRestaurantDetailsUseCase {
  final RestaurantRepository repository;

  GetRestaurantDetailsUseCase(this.repository);

  Future<RestaurantDetailsEntity> call(String restaurantId) {
    return repository.getRestaurantDetails(restaurantId);
  }
}
