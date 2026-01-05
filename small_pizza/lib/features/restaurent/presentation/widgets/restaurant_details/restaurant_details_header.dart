import 'package:flutter/material.dart';
import 'package:small_pizza/config/theme/app_theme.dart';
import 'package:small_pizza/features/restaurent/domain/entities/restaurant_entity.dart';

class RestaurantHeader extends StatelessWidget {
  final RestaurantEntity restaurant;

  const RestaurantHeader({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = restaurant.status.name.toLowerCase() == 'open';

    return SliverAppBar(
      expandedHeight: 260.0,
      floating: false,
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.65),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            restaurant.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.6),
                      blurRadius: 10,
                    ),
                  ],
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Main hero image
            Image.asset(
              restaurant.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.shade800,
                child: const Icon(
                  Icons.restaurant_rounded,
                  size: 80,
                  color: Colors.white54,
                ),
              ),
            ),

            // Gradient overlay (darker at bottom)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.75),
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),

            // Status badge (top-right)
            Positioned(
              top: 48,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: isOpen ? Colors.green.shade700 : Colors.red.shade700,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isOpen ? Icons.check_circle : Icons.access_time_filled,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isOpen ? 'OPEN NOW' : 'CLOSED',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Optional: Popular badge (bottom-left)
            if (restaurant.isPopular)
              Positioned(
                bottom: 80,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'POPULAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),

      // Back button & actions styling
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.favorite_border_rounded, color: Colors.white),
            ),
            onPressed: () {
              // TODO: Add to favorites
            },
          ),
        ),
      ],
    );
  }
}