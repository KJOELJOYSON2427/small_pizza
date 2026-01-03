import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final VoidCallback onViewAll;

  const SectionHeader({super.key, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular from this restaurant',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: onViewAll,
            child: const Text('View Full Menu'),
          ),
        ],
      ),
    );
  }
}
