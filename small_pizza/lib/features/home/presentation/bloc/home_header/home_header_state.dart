import 'package:equatable/equatable.dart';

class HomeHeaderState extends Equatable {
  final String userName;
  final String locationName;
  final bool isLoading;
   final bool openLocationSheet;

  const HomeHeaderState({
    required this.userName,
    required this.locationName,
    this.isLoading = false,
    this.openLocationSheet = false,
  });


  HomeHeaderState copyWith({
    String? userName,
    String? locationName,
    bool? isLoading,
     bool? openLocationSheet,
  }){
    return HomeHeaderState(
      userName: userName ?? this.userName,
      locationName: locationName ?? this.locationName,
      isLoading: isLoading ?? this.isLoading,
       openLocationSheet: openLocationSheet ?? this.openLocationSheet,
    );
  }

   factory HomeHeaderState.initial() => const HomeHeaderState(
        userName: 'Akila',
        locationName: 'Current Location',
      );
   @override
  List<Object?> get props => [userName, locationName, isLoading,openLocationSheet];
}
