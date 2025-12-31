import 'package:small_pizza/features/food/domain/enums/food_type.dart';

class DietaryInfoEntity {
  final Set<FoodType> supportedFoodTypes;

  const DietaryInfoEntity({required this.supportedFoodTypes});

  bool get isPureVeg =>
      supportedFoodTypes.length == 1 &&
      supportedFoodTypes.contains(FoodType.veg);
}
