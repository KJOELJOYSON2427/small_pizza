import 'package:flutter/material.dart';
import 'package:small_pizza/features/food/domain/enums/menu_category.dart';
import 'package:small_pizza/features/food/presentation/widgets/food_list.dart';
import 'package:small_pizza/features/food/presentation/widgets/search_bar_category.dart';

class FoodListPage extends StatelessWidget {
  final String restaurantId;
  final MealCategory category;

  const FoodListPage({
    super.key,
    required this.restaurantId,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.name.toUpperCase())),
      body: Column(
        children: [
          SearchBarForCategory(),
          Expanded(child: FoodList()),
        ],
      ),
    );
  }
}
