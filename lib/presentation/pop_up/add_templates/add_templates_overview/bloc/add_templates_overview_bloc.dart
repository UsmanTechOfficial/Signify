import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_templates_overview_event.dart';
part 'add_templates_overview_state.dart';

class AddTemplatesOverviewBloc extends Bloc<AddTemplatesOverviewEvent, AddTemplatesOverviewState> {
  AddTemplatesOverviewBloc() : super(AddTemplatesOverviewInitial()) {
    on<AddTemplatesOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
