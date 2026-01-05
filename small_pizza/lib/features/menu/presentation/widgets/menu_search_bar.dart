// features/menu/presentation/widgets/menu_search_bar.dart

import 'package:flutter/material.dart';

class MenuSearchBar extends StatelessWidget {
  final VoidCallback? onTap;

  const MenuSearchBar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(width: 12),
            Text(
              'Search food',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
