// restaurant_mock_data.dart
import '../models/restaurant_model.dart';

class RestaurantMockData {
  static final List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: 'r1',
      name: 'Italiano Pizza',
      imageUrl: 'assets/img/item_1.png',
      rating: 4.6,
      ratingCount: 320,
      status: 'open',
      category: 'bakery',
      cuisines: ['italian'],
      isPopular: true,
      mostOrderedCount: 540,
    ),

    RestaurantModel(
      id: 'r2',
      name: 'Sri Lankan Spices',
      imageUrl: 'assets/img/item_2.png',
      rating: 4.4,
      ratingCount: 210,
      status: 'open',
      category: 'bakery',
      cuisines: ['sriLankan'],
      isPopular: true,
      mostOrderedCount: 420,
    ),

    RestaurantModel(
      id: 'r3',
      name: 'Spice Hub',
      imageUrl: 'assets/img/item_3.png',
      rating: 4.2,
      ratingCount: 180,
      status: 'closed',
      category: 'bakery',
      cuisines: ['indian'],
      recentlyPlaced: DateTime.now().subtract(const Duration(days: 2)),
    ),

    RestaurantModel(
      id: 'r4',
      name: 'Fusion Feast',
      imageUrl: 'assets/img/item_1.png',
      rating: 4.7,
      ratingCount: 500,
      status: 'open',
      category: 'bakery',
      cuisines: ['italian', 'indian'],
      isPopular: true,
    ),
  ];
}
