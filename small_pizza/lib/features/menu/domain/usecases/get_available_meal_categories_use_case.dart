import 'package:small_pizza/features/food/domain/enums/menu_category.dart';
import 'package:small_pizza/features/food/domain/repositories/food_repository.dart';

class GetAvailableMealCategoriesUseCase {
  final FoodRepository repository;

  GetAvailableMealCategoriesUseCase(this.repository);

  Future<List<(MealCategory, int)>> call(String restaurantId) {
    return repository.getAvailableMealCategoriesAndCategoryCount(restaurantId);
  }
}
