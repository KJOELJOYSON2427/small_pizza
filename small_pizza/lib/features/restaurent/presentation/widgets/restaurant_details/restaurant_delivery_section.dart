import 'package:flutter/material.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
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

    final bool isFreeDelivery = delivery.deliveryFee <= 0;
    final bool isFastDelivery = delivery.maxDeliveryTime <= 25;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Information',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Delivery Time Card
              _DeliveryInfoChip(
                icon: Icons.timer_outlined,
                title: 'Time',
                value: '${delivery.minDeliveryTime}-${delivery.maxDeliveryTime} mins',
                highlight: isFastDelivery,
                highlightColor: Colors.green.shade700,
                subtitle: isFastDelivery ? 'Fast' : null,
              ),

              // Vertical divider
              Container(
                width: 1,
                height: 50,
                color: Colors.grey.shade300,
              ),

              // Delivery Fee Card
              _DeliveryInfoChip(
                icon: Icons.delivery_dining_outlined,
                title: 'Fee',
                value: isFreeDelivery ? 'FREE' : '₹${delivery.deliveryFee.toStringAsFixed(0)}',
                highlight: isFreeDelivery,
                highlightColor: AppTheme.primaryColor,
                subtitle: isFreeDelivery ? 'Yay!' : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DeliveryInfoChip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool highlight;
  final Color? highlightColor;
  final String? subtitle;

  const _DeliveryInfoChip({
    required this.icon,
    required this.title,
    required this.value,
    this.highlight = false,
    this.highlightColor,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final color = highlight ? (highlightColor ?? AppTheme.primaryColor) : Colors.grey.shade800;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: highlight ? highlightColor?.withOpacity(0.12) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 11,
              color: highlightColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}