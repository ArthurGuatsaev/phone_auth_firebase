part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class ChangeHomeIndexEvent extends HomeEvent {
  final int homeIndex;
  const ChangeHomeIndexEvent({required this.homeIndex});
}

class ChangeOnbIndicatorEvent extends HomeEvent {
  final int index;
  const ChangeOnbIndicatorEvent({required this.index});
}
