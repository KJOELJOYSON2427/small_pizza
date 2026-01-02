import 'package:small_pizza/features/restaurent/data/datasorces/restaurant_mock_datasource.dart';
import 'package:small_pizza/features/restaurent/data/mappers/restaurant_mapper.dart';
import 'package:small_pizza/features/restaurent/data/models/restaurant_model.dart';
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

  @override
  Future<List<RestaurantEntity>> getPopularRestaurantswithPage({
    int page =1,
    int limit =10,
  }) async {
    // 1️⃣ Get all restaurants from data source
    final List<RestaurantModel> models = await dataSource.getAllRestaurants();

    final List<RestaurantEntity> allRestaurants = models
        .map(RestaurantMapper.toEntity)
        .toList();

    // 2️⃣ Filter only popular restaurants
    final popularRestaurants = allRestaurants
        .where((restaurant) => restaurant.isPopular)
        .toList();

    // 3️⃣ Sort by rating (highest first)
  popularRestaurants.sort(
    (a, b) => b.rating.compareTo(a.rating),
  );

      // 4️⃣ Pagination calculation
  final startIndex = (page - 1) * limit;
  final endIndex = startIndex + limit;

  // 5️⃣ Handle edge cases safely
  if (startIndex >= popularRestaurants.length) {
    return [];
  }

  return popularRestaurants.sublist(
    startIndex,
    endIndex > popularRestaurants.length
        ? popularRestaurants.length
        : endIndex,
  );
  }
}
