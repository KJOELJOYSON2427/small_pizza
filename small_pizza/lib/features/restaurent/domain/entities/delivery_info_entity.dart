class DeliveryInfoEntity {
  final int minDeliveryTime; // minutes
  final int maxDeliveryTime;
  final double deliveryFee;

  const DeliveryInfoEntity({
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.deliveryFee,
  });
}
