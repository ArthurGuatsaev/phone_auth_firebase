// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  final int homeIndex;

  final int onboardIndex;

  const HomeState({
    this.onboardIndex = 0,
    this.homeIndex = 0,
  });

  HomeState copyWith({int? onboardIndex, int? homeIndex}) {
    return HomeState(
        onboardIndex: onboardIndex ?? this.onboardIndex,
        homeIndex: homeIndex ?? this.homeIndex);
  }
}
