import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../bloc/popular_restaurants/popular_restaurants_bloc.dart';
import '../bloc/popular_restaurants/popular_restaurants_event.dart';
import '../widgets/popular_restaurants_list.dart';

class PopularRestaurantsView extends StatelessWidget {
  const PopularRestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          sl<PopularRestaurantsWithPageBloc>()..add(LoadPopularRestaurants()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          // Make background transparent so gradient can show through
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,

          // Title styling
          title: const Text(
            'Popular Restaurants',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
              fontSize: 20,
            ),
          ),
          centerTitle: true,

          // Gradient background
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.primaryColor, // Main primary color
                  theme.primaryColor.withOpacity(
                    0.85,
                  ), // Slightly lighter/faded
                  theme.primaryColor.withOpacity(0.75), // Even softer
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
          ),

          // Icons & title color (important for contrast)
          foregroundColor: Colors.white,

          // Optional: subtle bottom border/shadow for depth
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.25),
                    Colors.white.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
        ),

        body: SafeArea(
          bottom: false,
          child: Padding(
            // Bottom padding to prevent content hiding under bottom nav bar
            padding: EdgeInsets.fromLTRB(0, 0, 0, 90),
            child: const PopularRestaurantsList(),
          ),
        ),
      ),
    );
  }
}
