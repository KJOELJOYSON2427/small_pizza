import 'package:equatable/equatable.dart';

abstract class HomeHeaderEvent extends Equatable {
  const HomeHeaderEvent();

  @override
  List<Object?> get props => [];
}


class LoadHomeHeader extends HomeHeaderEvent {}

class LocationTappedEvent extends HomeHeaderEvent {}

class LocationSelectedEvent extends HomeHeaderEvent {
  final String location;

  const LocationSelectedEvent(this.location);
}