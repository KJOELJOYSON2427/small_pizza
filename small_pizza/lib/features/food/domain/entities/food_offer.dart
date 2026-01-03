import 'package:small_pizza/features/food/domain/enums/offer_type.dart';

class FoodOfferEntity {
  final OfferType type;
  final double? value; // % or flat amount
  final DateTime? validTill;

  const FoodOfferEntity({
    required this.type,
    this.value,
    this.validTill,
  });
}
