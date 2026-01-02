


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/recent_items/recent_food_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/recent_items/recent_food_state.dart';
import 'package:small_pizza/features/home/presentation/widgets/recent_items/recent_items_section_header.dart';
import 'package:small_pizza/features/home/presentation/widgets/recent_items/recent_items_vertical_list_tile.dart';

class RecentItemsSection extends StatelessWidget {
  const RecentItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecentFoodsBloc, RecentFoodsState>(
      builder: (context, state) {
        if (state is RecentFoodsLoading) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is RecentFoodsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RecentItemsHeader(),
              const SizedBox(height: 12),
              ListView.separated(
                itemCount: state.foods.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  return RecentFoodTile(
                    food: state.foods[index],
                  );
                },
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
