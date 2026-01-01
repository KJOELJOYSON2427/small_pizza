import 'package:small_pizza/features/restaurent/data/datasorces/restaurant_mock_data.dart';
import 'package:small_pizza/features/restaurent/data/datasorces/restaurant_mock_datasource.dart';
import 'package:small_pizza/features/restaurent/data/models/restaurant_model.dart';

class RestaurantMockDataSource implements RestaurantDataSource {
  @override
  Future<List<RestaurantModel>> getAllRestaurants() async {
    // simulate API delay
    await Future.delayed(const Duration(milliseconds: 300));
    print("came ${RestaurantMockData.restaurants}");
    return RestaurantMockData.restaurants;
  }
}
