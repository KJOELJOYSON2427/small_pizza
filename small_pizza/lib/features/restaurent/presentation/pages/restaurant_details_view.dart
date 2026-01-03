import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_bloc.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_event.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_bloc.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_state.dart';
import 'package:small_pizza/features/restaurent/presentation/pages/popular_restaurant_preview_view.dart';
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/restaurant_delivery_section.dart';
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/restaurant_details_header.dart';
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/restaurant_info_section.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            print("came here for error");
            return Center(child: Text(state.error!));
          }

          if (state.details == null) {
            return const Center(child: Text('No restaurant data'));
          }

          final details = state.details!;

          return CustomScrollView(
            slivers: [
              /// HEADER IMAGE + NAME
              RestaurantHeader(restaurant: details.restaurant),

              /// BASIC INFO
              SliverToBoxAdapter(
                child: RestaurantInfoSection(details: details),
              ),

              /// DELIVERY INFO
              SliverToBoxAdapter(
                child: RestaurantDeliverySection(details: details),
              ),

              SliverToBoxAdapter(
                child: BlocProvider<PopularFromRestaurantBloc>(
                  create: (context) =>
                      context.read<PopularFromRestaurantBloc>() // ← new instance
                        ..add(
                          LoadPopularFromRestaurant(
                            details.restaurant.id,
                          ),
                        ),
                  child: PopularFromRestaurantSection(
                    restaurantId: details.restaurant.id,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
