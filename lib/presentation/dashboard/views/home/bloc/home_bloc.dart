import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SelectTile>((event, emit) {
      emit(state.copyWith(selectedTileIndex: event.index));
    });

    on<SelectCategory>((event, emit) {
      emit(state.copyWith(selectedCategoryIndex: event.index));
    });

    on<SelectDoc>((event, emit) {
      emit(state.copyWith(selectedDocIndex: event.index));
    });
  }
}
