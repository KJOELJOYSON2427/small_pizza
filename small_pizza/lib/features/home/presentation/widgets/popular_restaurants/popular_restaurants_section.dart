import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/home/presentation/widgets/popular_restaurants/popular_restaurants_card.dart';
import 'package:small_pizza/features/home/presentation/widgets/popular_restaurants/popular_restaurants_section_header.dart';
import '../../bloc/popular_restaurants/popular_restaurants_bloc.dart';
import '../../bloc/popular_restaurants/popular_restaurants_event.dart';
import '../../bloc/popular_restaurants/popular_restaurants_state.dart';

class PopularRestaurantsSection extends StatelessWidget {
  const PopularRestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularRestaurantsBloc, PopularRestaurantsState>(
      builder: (context, state) {
        if (state is PopularRestaurantsLoading) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          );
        }

        if (state is PopularRestaurantsLoaded) {
          return Column(children: [
            const PopularRestaurantsHeader(),
            ...state.restaurants.map(
              (r) => PopularRestaurantCard(restaurant: r)
            )
          ]);
        }
         return const SizedBox.shrink();
      },
    );
  }
}
