
import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';

class PopularFromRestaurantState {
  final bool isLoading;
  final List<FoodEntity> foods;
  final String? error;

  const PopularFromRestaurantState({
    this.isLoading = false,
    this.foods = const [],
    this.error,
  });

  PopularFromRestaurantState copyWith({
    bool? isLoading,
    List<FoodEntity>? foods,
    String? error,
  }) {
    return PopularFromRestaurantState(
      isLoading: isLoading ?? this.isLoading,
      foods: foods ?? this.foods,
      error: error,
    );
  }
}
