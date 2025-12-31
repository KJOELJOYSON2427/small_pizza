import 'package:small_pizza/features/food/data/datasorces/food_mock_data.dart';
import 'package:small_pizza/features/food/data/datasorces/food_mock_datasource.dart';
import 'package:small_pizza/features/food/data/models/food_model.dart';

class FoodMockDatasourceImpl implements FoodMockDataSource{

  @override
  Future<List<FoodModel>> getAll()async {
    await Future.delayed(const Duration(milliseconds: 300));
    return FoodMockData.foods;
  }
}