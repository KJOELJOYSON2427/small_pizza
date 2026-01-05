import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/food/presentation/cubit/food_list_cubit.dart';

class SearchBarForCategory extends StatelessWidget {
  const SearchBarForCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        onChanged: context.read<FoodListCubit>().search,
        decoration: InputDecoration(
          hintText: 'Search food',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
