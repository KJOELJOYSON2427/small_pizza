// food_mock_datasource.dart
import '../models/food_model.dart';

class FoodMockData {
  static List<FoodModel> foods = [
    FoodModel(
      id: 'f1',
      name: 'Margherita Pizza',
      description: 'Classic Italian cheese pizza',
      imageUrl: 'assets/img/pizza.png',
      price: 8.99,
      cuisine: 'italian',
      foodType: 'veg',
      restaurantId: 'r1',
      restaurantName: 'Italiano Pizza',
      rating: 4.7,
      ratingCount: 180,
      isPopular: true,
      createdAt: DateTime.now(),
    ),
    FoodModel(
      id: 'f2',
      name: 'Chicken Kottu',
      description: 'Spicy Sri Lankan street food',
      imageUrl: 'assets/img/kottu.png',
      price: 6.49,
      cuisine: 'sriLankan',
      foodType: 'nonVeg',
      restaurantId: 'r2',
      restaurantName: 'Sri Lankan Spices',
      rating: 4.6,
      ratingCount: 150,
      isPopular: true,
      createdAt: DateTime.now(),
    ),
  ];

 
}
