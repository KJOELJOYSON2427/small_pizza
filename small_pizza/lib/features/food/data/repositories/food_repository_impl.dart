

import 'package:small_pizza/features/food/data/datasorces/food_mock_datasource.dart';
import 'package:small_pizza/features/food/data/mappers/food_mapper.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';
import 'package:small_pizza/features/food/domain/repositories/food_repository.dart';
import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodMockDataSource dataSource;

  FoodRepositoryImpl(this.dataSource);

  @override
  Future<List<FoodEntity>> getPopularFoods() async {
    final models = await dataSource.getAll();
    return models
        .where((f) => f.isPopular)
        .map(FoodMapper.toEntity)
        .toList();
  }

  
  
  @override
  Future<List<FoodEntity>> getFoodsByRestaurant(String restaurantId) {
    // TODO: implement getFoodsByRestaurant
    throw UnimplementedError();
  }
  
  @override
  Future<List<FoodEntity>> getRecentFoods() {
    // TODO: implement getRecentFoods
    throw UnimplementedError();
  }
}
