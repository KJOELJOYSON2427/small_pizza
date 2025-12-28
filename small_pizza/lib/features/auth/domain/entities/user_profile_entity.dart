import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
   final String uid;
  final String name;
  final String? photoUrl;
  final String mobile;
  final String address;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProfileEntity({
    required this.uid,
    required this.name,
    this.photoUrl,
    required this.mobile,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [
           uid,
        name,
        photoUrl,
        mobile,
        address,
        createdAt,
        updatedAt,
      ];
}
