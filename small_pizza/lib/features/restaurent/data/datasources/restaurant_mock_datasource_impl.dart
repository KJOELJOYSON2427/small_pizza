import 'package:small_pizza/features/restaurent/data/datasources/restaurant_mock_data.dart';
import 'package:small_pizza/features/restaurent/data/datasources/restaurant_mock_datasource.dart';
import 'package:small_pizza/features/restaurent/data/models/restaurant_details_model.dart';
import 'package:small_pizza/features/restaurent/data/models/restaurant_model.dart';

class RestaurantMockDataSource implements RestaurantDataSource {
  @override
  Future<List<RestaurantModel>> getAllRestaurants() async {
    // simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));
    print("came ${RestaurantMockData.restaurants}");
    return RestaurantMockData.restaurants;
  }

  Future<RestaurantModel?> getRestaurantById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    print("Searching in: ${RestaurantMockData.restaurants.map((r) => r.id)}");

    try {
      return RestaurantMockData.restaurants.firstWhere((r) => r.id == id);
    } catch (_) {
      return null; // or you can return default empty model
    }
  }

  @override
  Future<RestaurantDetailsModel> getRestaurantDetails(String id) async {
      await Future.delayed(const Duration(milliseconds: 300));
    
     return RestaurantMockData.restaurantDetails;
  
   
  }
}
