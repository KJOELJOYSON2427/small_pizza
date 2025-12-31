import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable{
  
  final String street;
  final String area;
  final String city;
  final String pincode;
  final double latitude;
  final double longitude;

  const AddressEntity({
    required this.street,
    required this.area,
    required this.city,
    required this.pincode,
    required this.latitude,
    required this.longitude,
  });


  @override
  List<Object?> get props => [street, area, city, pincode, latitude, longitude];

}
