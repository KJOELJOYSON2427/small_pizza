import '../models/food_model.dart';

class FoodMockData {
  static final List<FoodModel> foods = [
    FoodModel(
      id: 'f1',
      name: 'Margherita Pizza',
      description: 'Classic Italian pizza with fresh mozzarella & basil',
      imageUrl: 'assets/img/m_res_1.png',
      price: 8.99,

      cuisine: 'italian',
      mealCategory: 'dinner',
      foodType: 'veg',

      restaurantId: '1',

      isAvailable: true,

      rating: 4.7,
      ratingCount: 180,
      isPopular: true,

      offerType: 'percentage',
      offerValue: 20,
      offerValidTill: DateTime.now().add(const Duration(days: 3)),

      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),

    FoodModel(
      id: 'f2',
      name: 'Chicken Kottu',
      description: 'Spicy Sri Lankan street-style chopped roti with chicken',
      imageUrl: 'assets/img/m_res_2.png',
      price: 6.49,

      cuisine: 'sriLankan',
      mealCategory: 'beverages',
      foodType: 'nonVeg',

      restaurantId: '1',

      isAvailable: true,

      rating: 4.6,
      ratingCount: 150,
      isPopular: true,

      offerType: null,
      offerValue: null,
      offerValidTill: null,

      displayOrder: 2,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),

    FoodModel(
      id: 'f3',
      name: 'Masala Dosa',
      description: 'Crispy dosa filled with spiced potato masala',
      imageUrl: 'assets/img/m_res_3.png',
      price: 3.99,

      cuisine: 'indian',
      mealCategory: 'desserts',
      foodType: 'veg',

      restaurantId: '1',

      isAvailable: true,

      rating: 4.8,
      ratingCount: 260,
      isPopular: true,

      offerType: 'percentage',
      offerValue: 10,
      offerValidTill: DateTime.now().add(const Duration(days: 1)),

      displayOrder: 1,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),

    FoodModel(
      id: 'f4',
      name: 'Chocolate Brownie',
      description: 'Rich chocolate brownie served warm',
      imageUrl: 'assets/img/m_res_4.png',
      price: 4.49,

      cuisine: 'american',
      mealCategory: 'snacks',
      foodType: 'veg',

      restaurantId: '1',

      isAvailable: false,

      rating: 4.4,
      ratingCount: 95,
      isPopular: false,

      offerType: null,
      offerValue: null,
      offerValidTill: null,

      displayOrder: 99,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];
}
