import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';
import 'package:small_pizza/features/menu/domain/usecases/get_available_meal_categories_use_case.dart';
import 'package:small_pizza/features/menu/presentation/bloc/menu_event.dart';
import 'package:small_pizza/features/menu/presentation/bloc/menu_sate.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetAvailableMealCategoriesUseCase getCategories;

  MenuBloc(this.getCategories) : super(const MenuState()) {
    on<LoadMenuCategories>(_onLoad);
  }

  Future<void> _onLoad(
  LoadMenuCategories event,
  Emitter<MenuState> emit,
) async {
  emit(state.copyWith(isLoading: true));

  try {
    final List<(MealCategory, int)> result = 
        await getCategories(event.restaurantId);
    
    // Convert tuples to your value class (or keep as records)
    final categories = result
        .map((tuple) => MealCategoryWithCount(tuple.$1, tuple.$2))
        .toList();

    emit(state.copyWith(isLoading: false, categories: categories));
  } catch (e) {
    emit(state.copyWith(isLoading: false, error: e.toString()));
  }
}
}
