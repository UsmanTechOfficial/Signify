import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_template_detail_event.dart';
part 'add_template_detail_state.dart';

class AddTemplateDetailBloc extends Bloc<AddTemplateDetailEvent, AddTemplateDetailState> {
  AddTemplateDetailBloc() : super(AddTemplateDetailInitial()) {
    on<AddTemplateDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
