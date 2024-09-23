import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_templates_overview_event.dart';
part 'add_templates_overview_state.dart';

class AddTemplatesOverviewBloc
    extends Bloc<AddTemplatesOverviewEvent, AddTemplatesOverviewState> {
  AddTemplatesOverviewBloc() : super(AddTemplatesOverviewInitial()) {
    on<AddTemplatesOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
