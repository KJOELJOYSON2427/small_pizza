
  import 'package:small_pizza/features/food/data/datasorces/food_mock_datasource_impl.dart';
import 'package:small_pizza/features/food/data/models/food_model.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';

abstract class FoodMockDataSource {
  Future<List<FoodModel>> getAll();

   Future<List<FoodModel>> getFoodByRestaurantById(String id);

      Future<List<CategoryWithCount>> getMealCategoriesWithCounts(String id);
 

 Future<List<FoodModel>> getFoodsByRestaurantAndCategory(
     String restaurantId,
     MealCategory category,
  );
 }