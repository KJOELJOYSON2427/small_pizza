// menu_state.dart
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';

class MenuState {
  final bool isLoading;
  final List<MealCategoryWithCount>? categories;   // ← changed
  final String? error;

  const MenuState({
    this.isLoading = false,
    this.categories,
    this.error,
  });

  MenuState copyWith({
    bool? isLoading,
    List<MealCategoryWithCount>? categories,
    String? error,
  }) {
    return MenuState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      error: error ?? this.error,
    );
  }
}

// Simple value class (can be record too)
class MealCategoryWithCount {
  final MealCategory category;
  final int count;

  const MealCategoryWithCount(this.category, this.count);
}