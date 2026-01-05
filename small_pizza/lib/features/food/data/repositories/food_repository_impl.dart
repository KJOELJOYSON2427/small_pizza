import 'package:small_pizza/features/food/data/datasorces/food_mock_datasource.dart';
import 'package:small_pizza/features/food/data/mappers/food_mapper.dart';
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';
import 'package:small_pizza/features/food/domain/extensions/meal_category_extension.dart';
import 'package:small_pizza/features/food/domain/repositories/food_repository.dart';
import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodMockDataSource dataSource;

  FoodRepositoryImpl(this.dataSource);

  @override
  Future<List<FoodEntity>> getPopularFoods() async {
    final models = await dataSource.getAll();
    return models.where((f) => f.isPopular).map(FoodMapper.toEntity).toList();
  }

  @override
  Future<List<FoodEntity>> getFoodsByRestaurant(String restaurantId) async {
    final models = await dataSource.getFoodByRestaurantById(
      restaurantId,
    ); // should change
    return models.map(FoodMapper.toEntity).toList();
  }

  @override
  Future<List<FoodEntity>> getRecentFoods() async {
    final models = await dataSource.getAll();
    return models.map(FoodMapper.toEntity).toList();
  }

 @override
Future<List<(MealCategory, int)>> getAvailableMealCategoriesAndCategoryCount(
  String restaurantId,
) async {
  final raw = await dataSource.getMealCategoriesWithCounts(restaurantId);

  final result = <(MealCategory, int)>[];

  for (final item in raw) {
    try {
      final categoryEnum = item.category.toMealCategory();
      result.add((categoryEnum, item.count));
    } catch (_) {
      // silently skip invalid categories
    }
  }

  // Sort by enum name (alphabetical)
  result.sort((a, b) => a.$1.name.compareTo(b.$1.name));

  return result;
}

  @override
  Future<List<FoodEntity>> getFoodsByRestaurantAndCategory({required String restaurantId, required MealCategory category}) async{
    final foods = await dataSource.getFoodsByRestaurantAndCategory(restaurantId,category);

    return foods.map(FoodMapper.toEntity).toList();
  }
}
