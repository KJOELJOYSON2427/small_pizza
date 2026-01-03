import 'package:flutter/material.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_entity.dart';

class RestaurantHeader extends StatelessWidget {
  final RestaurantEntity restaurant;

  const RestaurantHeader({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(restaurant.name),
        background: Image.asset(restaurant.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
