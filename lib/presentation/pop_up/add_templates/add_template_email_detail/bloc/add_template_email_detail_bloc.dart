import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_template_email_detail_event.dart';
part 'add_template_email_detail_state.dart';

class AddTemplateEmailDetailBloc
    extends Bloc<AddTemplateEmailDetailEvent, AddTemplateEmailDetailState> {
  AddTemplateEmailDetailBloc() : super(AddTemplateEmailDetailInitial()) {
    on<AddTemplateEmailDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
