import 'package:small_pizza/features/restaurent/domain/enums/cuisine_variety.dart';

extension CuisineX on String {
  Cuisine toCuisine() {
    return Cuisine.values.firstWhere(
      (e) => e.name == this,
      orElse: () => Cuisine.indian,
    );
  }
}
