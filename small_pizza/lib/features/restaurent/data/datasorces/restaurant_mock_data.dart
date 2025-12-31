// restaurant_mock_data.dart
import '../models/restaurant_model.dart';

class RestaurantMockData {
  static final List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: 'r1',
      name: 'Italiano Pizza',
      imageUrl: 'assets/images/restaurants/italiano.png',
      rating: 4.6,
      ratingCount: 320,
      status: 'open',
      category: 'delivery',
      cuisines: ['italian'],
      isPopular: true,
      mostOrderedCount: 540,
    ),

    RestaurantModel(
      id: 'r2',
      name: 'Sri Lankan Spices',
      imageUrl: 'assets/images/restaurants/srilankan.png',
      rating: 4.4,
      ratingCount: 210,
      status: 'open',
      category: 'delivery',
      cuisines: ['sriLankan'],
      isPopular: true,
      mostOrderedCount: 420,
    ),

    RestaurantModel(
      id: 'r3',
      name: 'Spice Hub',
      imageUrl: 'assets/images/restaurants/indian.png',
      rating: 4.2,
      ratingCount: 180,
      status: 'closed',
      category: 'delivery',
      cuisines: ['indian'],
      recentlyPlaced: DateTime.now().subtract(const Duration(days: 2)),
    ),

    RestaurantModel(
      id: 'r4',
      name: 'Fusion Feast',
      imageUrl: 'assets/images/restaurants/fusion.png',
      rating: 4.7,
      ratingCount: 500,
      status: 'open',
      category: 'both',
      cuisines: ['italian', 'indian'],
      isPopular: true,
    ),
  ];
}
