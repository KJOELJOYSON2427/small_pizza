import 'package:small_pizza/features/food/domain/enums/menu_category.dart';


extension MealCategoryX on String {
  MealCategory toMealCategory() {
    return MealCategory.values.firstWhere(
      (e) => e.name == this,
      orElse: () => MealCategory.lunch,
    );
  }
}
