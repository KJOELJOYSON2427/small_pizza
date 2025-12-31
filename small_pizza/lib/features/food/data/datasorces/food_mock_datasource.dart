
  import 'package:small_pizza/features/food/data/models/food_model.dart';

abstract class FoodMockDataSource {
  Future<List<FoodModel>> getAll();
 }