import 'package:small_pizza/features/restaurent/data/datasorces/restaurant_mock_datasource.dart';
import 'package:small_pizza/features/restaurent/data/mappers/restaurant_mapper.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_details_entity.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_entity.dart';
import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';
import 'package:small_pizza/features/restaurent/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource dataSource;

  RestaurantRepositoryImpl(this.dataSource);

  @override
  Future<List<RestaurantEntity>> getHomeRestaurants() async {
    final models = await dataSource.getAllRestaurants();

    return models.map(RestaurantMapper.toEntity).toList();
  }

  @override
  Future<List<RestaurantEntity>> getPopularRestaurants() async {
    final models = await dataSource.getAllRestaurants();
    return models
        .where((m) => m.isPopular)
        .map(RestaurantMapper.toEntity)
        .toList();
  }

  @override
  Future<List<RestaurantEntity>> getRecentRestaurants() async {
    final models = await dataSource.getAllRestaurants();

    return models
        .where((m) => m.recentlyPlaced != null)
        .map(RestaurantMapper.toEntity)
        .toList();
  }

  @override
  Future<RestaurantDetailsEntity> getRestaurantDetails(String restaurantId) {
    // TODO: implement getRestaurantDetails
    throw UnimplementedError();
  }

  @override
  Future<List<RestaurantEntity>> getRestaurantsByCuisine(
    Cuisine cuisine,
  ) async {
    final models = await dataSource.getAllRestaurants();

    return models
        .where((m) => m.cuisines.contains(cuisine.name))
        .map(RestaurantMapper.toEntity)
        .toList();
  }
}
