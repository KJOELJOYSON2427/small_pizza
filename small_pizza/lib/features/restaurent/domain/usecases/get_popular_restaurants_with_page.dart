import '../entities/restaurant_entity.dart';
import '../repositories/restaurant_repository.dart';

class GetPopularRestaurantsWithPageUseCase {
  final RestaurantRepository repository;

  const GetPopularRestaurantsWithPageUseCase(this.repository);

  Future<List<RestaurantEntity>> call({
    int page = 1,
    int limit = 10,
  }) {
    return repository.getPopularRestaurantswithPage(
      page: page,
      limit: limit,
    );
  }
}
