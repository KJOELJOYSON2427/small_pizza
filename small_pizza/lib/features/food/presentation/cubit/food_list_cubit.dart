import 'package:small_pizza/features/food/domain/entities/food_item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';
import 'package:small_pizza/features/food/domain/usecases/get_foods_by_category_usecase.dart';
part 'food_list_state.dart';


class FoodListCubit extends Cubit<FoodListState>{
   final GetFoodsByRestaurantAndCategoryUseCase useCase;

  FoodListCubit(this.useCase) : super(const FoodListState());

  Future<void> loadFoods({
    required String restaurantId,
    required MealCategory category,
  }) async {
    emit(state.copyWith(isLoading: true));

    try {
      final foods = await useCase(
        restaurantId: restaurantId,
        category: category,
      );

      emit(state.copyWith(
        isLoading: false,
        foods: foods,
        filteredFoods: foods,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

   void search(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(filteredFoods: state.foods));
      return;
    }

    final result = state.foods.where((food) {
      return food.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(filteredFoods: result));
  }
}