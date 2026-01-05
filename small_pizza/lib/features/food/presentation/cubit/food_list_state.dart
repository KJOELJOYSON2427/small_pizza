part of 'food_list_cubit.dart';



class FoodListState {
  final bool isLoading;
  final List<FoodEntity> foods;
  final List<FoodEntity> filteredFoods;
  final String? error;

  const FoodListState({
    this.isLoading = false,
    this.foods = const [],
    this.filteredFoods = const [],
    this.error,
  });

  FoodListState copyWith({
    bool? isLoading,
    List<FoodEntity>? foods,
    List<FoodEntity>? filteredFoods,
    String? error,
  }) {
    return FoodListState(
      isLoading: isLoading ?? this.isLoading,
      foods: foods ?? this.foods,
      filteredFoods: filteredFoods ?? this.filteredFoods,
      error: error,
    );
  }
}
