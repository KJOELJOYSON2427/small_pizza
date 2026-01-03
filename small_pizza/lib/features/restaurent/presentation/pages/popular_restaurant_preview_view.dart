

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_bloc.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_event.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_state.dart';
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/popular_restaurant_preview/popular_restaurant_preview_section_header.dart';
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/popular_restaurant_preview/popular_restaurant_preview_sfood_preview_card.dart';

class PopularFromRestaurantSection extends StatelessWidget {
  final String restaurantId;

  const PopularFromRestaurantSection({
    super.key,
    required this.restaurantId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularFromRestaurantBloc, PopularFromRestaurantState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          );
        }
    
        if (state.foods.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
    
        return SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                onViewAll: () {
                  // navigation only
                  context.go(
                    '/menu',
                    extra: restaurantId,
                  );
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: state.foods.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, index) {
                    return FoodPreviewCard(food: state.foods[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
