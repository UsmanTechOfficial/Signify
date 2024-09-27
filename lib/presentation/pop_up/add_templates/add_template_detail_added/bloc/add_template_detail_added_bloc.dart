import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_template_detail_added_event.dart';
part 'add_template_detail_added_state.dart';

class AddTemplateDetailAddedBloc
    extends Bloc<AddTemplateDetailAddedEvent, AddTemplateDetailAddedState> {
  AddTemplateDetailAddedBloc() : super(AddTemplateDetailInitial()) {
    on<AddTemplateDetailAddedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
