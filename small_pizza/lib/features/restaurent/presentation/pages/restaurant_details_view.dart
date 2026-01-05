import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_bloc.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/popular_foods_from_restaurant/popular_from_restaurant_event.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_bloc.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_state.dart';
import 'package:small_pizza/features/restaurent/presentation/pages/popular_restaurant_preview_view.dart';
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/restaurant_delivery_section.dart';
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/restaurant_details_header.dart'; // ← fixed import name
import 'package:small_pizza/features/restaurent/presentation/widgets/restaurant_details/restaurant_info_section.dart';
// Assuming you have this widget:

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
        builder: (context, state) {
          // Loading state
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error state
          if (state.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline_rounded, size: 64, color: Colors.red.shade400),
                  const SizedBox(height: 16),
                  Text(
                    state.error!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.red.shade700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      // Optional: retry logic
                      // context.read<RestaurantDetailsBloc>().add(/* retry event */);
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          // No data state
          if (state.details == null) {
            return const Center(
              child: Text(
                'Restaurant details not available',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final details = state.details!;

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // 1. Hero Header with collapsing image
              RestaurantHeader(restaurant: details.restaurant),

              // 2. Basic restaurant info (name, rating, location, cuisines)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: RestaurantInfoSection(details: details),
                ),
              ),

              // Subtle divider
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 1,
                  ),
                ),
              ),

              // 3. Delivery information section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: RestaurantDeliverySection(details: details),
                ),
              ),

              // 4. Popular items from this restaurant
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 24),
                  child: BlocProvider<PopularFromRestaurantBloc>(
                    create: (_) =>
                        sl<PopularFromRestaurantBloc>()
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
              ),

              // Optional: Extra bottom padding for better scroll feel
              const SliverToBoxAdapter(
                child: SizedBox(height: 80),
              ),
            ],
          );
        },
      ),
    );
  }
}