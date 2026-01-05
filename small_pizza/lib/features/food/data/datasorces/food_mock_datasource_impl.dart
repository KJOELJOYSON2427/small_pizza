import 'package:small_pizza/features/food/data/datasorces/food_mock_data.dart';
import 'package:small_pizza/features/food/data/datasorces/food_mock_datasource.dart';
import 'package:small_pizza/features/food/data/models/food_model.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';

class FoodMockDatasourceImpl implements FoodMockDataSource{

  @override
  Future<List<FoodModel>> getAll()async {
    await Future.delayed(const Duration(milliseconds: 300));
    return FoodMockData.foods;
  }

//   @override
//   Future<List<String>> getMealCategoryByRestaurantById(String restaurantId)async{
//      await Future.delayed(const Duration(milliseconds: 300));
//    final categories = FoodMockData.foods
//     .where((f) => f.restaurantId == restaurantId)
//     .map((f) => f.mealCategory)
//     .whereType<String>()           // removes nulls
//     .toSet()
//     .toList()
//   ..sort();

// return categories;


//   }
// Option 1: Return List<Map<String, dynamic>> (most flexible for UI)
// Option 2: Return List of simple class (cleaner if you use it a lot)


@override
Future<List<CategoryWithCount>> getMealCategoriesWithCounts(String restaurantId) async {
  await Future.delayed(const Duration(milliseconds: 300));

  final categoryCounts = <String, int>{};

  for (final food in FoodMockData.foods) {
    if (food.restaurantId == restaurantId) {
      final cat = food.mealCategory;
      if (cat != null && cat.isNotEmpty) {
        categoryCounts[cat] = (categoryCounts[cat] ?? 0) + 1;
      }
    }
  }

  return categoryCounts.entries
      .map((e) => CategoryWithCount(e.key, e.value))
      .toList()
    ..sort((a, b) => a.category.compareTo(b.category));
}



  @override
Future<List<FoodModel>> getFoodByRestaurantById(String id) async {
  // Simulate network/database delay
  await Future.delayed(const Duration(milliseconds: 300));

  return FoodMockData.foods.where((food) => food.restaurantId.toLowerCase() == id.toLowerCase()).toList();
}
 



Future<List<FoodModel>> getFoodsByRestaurantAndCategory(
  String restaurantId,
  MealCategory category,
) async {
  // Simulate network/database delay
  await Future.delayed(const Duration(milliseconds: 300));

  return FoodMockData.foods.where((food) {
    return food.restaurantId == restaurantId &&
        food.mealCategory == category.name && // enum → string match
        food.isAvailable;
  }).toList()..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
}



}

class CategoryWithCount {
  final String category;
  final int count;

  CategoryWithCount(this.category, this.count);
}