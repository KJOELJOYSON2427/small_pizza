import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:small_pizza/features/home/presentation/bloc/popular_food/popular_foods_bloc.dart';
import 'package:small_pizza/features/home/presentation/bloc/popular_food/popular_foods_state.dart';
import 'package:small_pizza/features/home/presentation/widgets/popular_food/most_popular_card.dart';
import 'package:small_pizza/features/home/presentation/widgets/popular_food/most_popular_section_header.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularFoodsBloc, PopularFoodsState>(
      builder: (context, state) {
        if (state is PopularFoodsLoading) {
          return const SizedBox(
            height: 220,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is PopularFoodsLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const MostPopularHeader(),
              const SizedBox(height: 12),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.foods.length,
                  itemBuilder: (context, index) {
                    return PopularFoodCard(food: state.foods[index]);
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();

      },
    );
  }
}
