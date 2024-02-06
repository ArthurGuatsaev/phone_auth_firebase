import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangeHomeIndexEvent>(onChangeHomeIndex);
    on<ChangeOnbIndicatorEvent>(onChangeOnbIndicatorIndex);
  }

  onChangeHomeIndex(ChangeHomeIndexEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeIndex: event.homeIndex));
  }

  onChangeOnbIndicatorIndex(
      ChangeOnbIndicatorEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(onboardIndex: event.index));
  }
}
