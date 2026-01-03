import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_bloc.dart';
import 'package:small_pizza/features/restaurent/presentation/bloc/restaurant_details/restaurant_details_event.dart';
import 'restaurant_details_view.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final String restaurantId;

   RestaurantDetailsPage({
    super.key,
    required this.restaurantId,
  }){
    print("created");
  }

  @override
  Widget build(BuildContext context) {
    final sl = GetIt.instance;

    return BlocProvider(
      create: (_) => sl<RestaurantDetailsBloc>()
        ..add(LoadRestaurantDetails(restaurantId)),
      child: const RestaurantDetailsView(),
    );
  }
}
