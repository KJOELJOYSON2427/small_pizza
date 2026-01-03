import '../enums/food_type.dart';

extension FoodTypeX on String {
  FoodType toFoodType() {
    return FoodType.values.firstWhere(
      (e) => e.name == this,
      orElse: () => FoodType.veg,
    );
  }
}
