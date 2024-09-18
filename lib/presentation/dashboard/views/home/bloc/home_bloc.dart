import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<String> agreementsList = [];
  List<String> templateList = [];
  List<String> foldersList = [];

  HomeBloc() : super(const HomeInitialState(0)) {
    on<SelectCategory>((event, emit) {
      if (state is HomeCategorySelectedState) {
        emit((state as HomeCategorySelectedState).copyWith(selectedCategoryIndex: event.index));
      } else {
        emit(HomeCategorySelectedState(selectedCategoryIndex: event.index));
      }
    });

    on<SelectDoc>((event, emit) {
      if (state is HomeDocSelectedState) {
        emit((state as HomeDocSelectedState).copyWith(selectedDocIndex: event.index));
      } else {
        emit(HomeDocSelectedState(selectedDocIndex: event.index));
      }
    });
  }
}
