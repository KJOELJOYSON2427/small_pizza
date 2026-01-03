import '../enums/offer_type.dart';

extension OfferTypeX on String {
  OfferType toOfferType() {
    return OfferType.values.firstWhere(
      (e) => e.name == this,
      orElse: () => OfferType.percentage,
    );
  }
}
