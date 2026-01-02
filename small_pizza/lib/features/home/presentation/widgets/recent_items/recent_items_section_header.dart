import 'package:flutter/material.dart';

class RecentItemsHeader extends StatelessWidget{
  const RecentItemsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Recent Items',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'View all',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
