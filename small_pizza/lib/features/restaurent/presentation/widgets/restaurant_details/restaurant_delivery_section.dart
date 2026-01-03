import 'package:flutter/material.dart';
import '../../../domain/entities/restaurant_details_entity.dart';

class RestaurantDeliverySection extends StatelessWidget {
  final RestaurantDetailsEntity details;

  const RestaurantDeliverySection({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    final delivery = details.deliveryInfo;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _InfoItem(
            icon: Icons.timer,
            text: '${delivery.minDeliveryTime}-${delivery.maxDeliveryTime} mins',
          ),
          _InfoItem(
            icon: Icons.delivery_dining,
            text: '₹${delivery.deliveryFee} delivery',
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 6),
        Text(text),
      ],
    );
  }
}
