part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class TabChanged extends NavigationEvent{

  final int index;
  TabChanged(this.index);
}