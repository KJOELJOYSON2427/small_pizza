import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/food/presentation/cubit/food_list_cubit.dart';
import 'package:small_pizza/features/food/presentation/widgets/food_card.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodListCubit, FoodListState>(
      builder: (context, state) {
        // 1️⃣ Loading
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // 2️⃣ Error
        if (state.error != null) {
          return Center(
            child: Text(
              state.error!,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        // 3️⃣ Empty
        if (state.filteredFoods.isEmpty) {
          return const Center(
            child: Text(
              'No food items found',
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        // 4️⃣ Success list
        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 80),
          itemCount: state.filteredFoods.length,
          itemBuilder: (context, index) {
            final food = state.filteredFoods[index];

            return FoodCard(food: food);
          },
        );
      },
    );
  }
}
